package ru.sberbank.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.sberbank.project.feign.NewsFeignClient;
import ru.sberbank.project.model.*;
import ru.sberbank.project.repository.article.ArticleRepository;
import ru.sberbank.project.repository.comment.CommentRepository;
import ru.sberbank.project.repository.user.UserRepository;
import ru.sberbank.project.util.UserUtil;
import ru.sberbank.project.util.exception.NotFoundException;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static ru.sberbank.project.util.ValidationUtil.checkNotFoundWithId;

@Service
public class ArticleServiceImpl implements ArticleService {

    private static final String REMOTE_ARTICLE_SERVICE = "remoteArticleRepo";
    private static final String LOCAL_ARTICLE_REPOSITORY = "localArticleRepo";
    private static final String REMOTE_COMMENT_SERVICE = "remoteCommentRepo";
    private static final String LOCAL_COMMENT_REPOSITORY = "localCommentRepo";

    private final ArticleRepository articleRepository;
    private final CommentRepository commentRepository;
    private final UserRepository userRepository;
    private final NewsFeignClient newsFeignClient;

    @Autowired
    public ArticleServiceImpl(
                              @Qualifier(REMOTE_ARTICLE_SERVICE) ArticleRepository articleRepository,
                              @Qualifier(REMOTE_COMMENT_SERVICE) CommentRepository commentRepository,
//                              @Qualifier(LOCAL_ARTICLE_REPOSITORY) ArticleRepository articleRepository,
//                              @Qualifier(LOCAL_COMMENT_REPOSITORY) CommentRepository commentRepository,
                              UserRepository userRepository,
                              NewsFeignClient newsFeignClient) {
        this.articleRepository = articleRepository;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
        this.newsFeignClient = newsFeignClient;
    }

    @Override
    public Article get(int id) throws NotFoundException {
        return checkNotFoundWithId(articleRepository.get(id), id);
    }

    @Override
    public void delete(int id, int userId) throws NotFoundException {
        checkNotFoundWithId(articleRepository.delete(id, userId), id);
    }

    @Override
    public List<Article> getAll(int userId) {
        return articleRepository.getAll(userId);
    }

    @Override
    public Article update(Article article, int userId) throws NotFoundException {
        return checkNotFoundWithId(articleRepository.save(article, userId), article.getId());
    }

    @Override
    public Article create(Article article, int userId) {
        Assert.notNull(article, "Article must not be null");
        article.setDateTime(LocalDateTime.now());
        return articleRepository.save(article, userId);
    }

    @Override
    public Comment saveComment(Comment comment, int userId) {
        comment.setUserId(userId);
        comment.setDateTime(LocalDateTime.now());
        return commentRepository.save(comment);
    }

    @Override
    public boolean deleteComment(int id, int userId) {
        return commentRepository.delete(id, userId);
    }

    @Override
    public List<CommentTo> getAllCommentsForArticleById(int id) {
        return commentRepository.getAll(id).stream()
                .map(CommentTo::new)
                .sorted(Comparator.comparing(CommentTo::getDateTime))
                .peek(commentTo -> commentTo.setUserTo(UserUtil.asTo(userRepository.get(commentTo.getUserId()))))
                .collect(Collectors.toList());
    }

    @Override
    public List<ArticleTo> getNews(List<User> users) {
        return newsFeignClient.getAll(users
                .stream()
                .map(AbstractBaseEntity::getId)
                .collect(Collectors.toList()))
                .stream()
                .map(ArticleTo::new)
                .peek(articleTo -> articleTo.setUserFullName(userRepository.get(articleTo.getUserId()).getFullName()))
                .collect(Collectors.toList());
    }
}
