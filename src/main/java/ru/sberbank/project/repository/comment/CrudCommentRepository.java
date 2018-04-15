package ru.sberbank.project.repository.comment;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import ru.sberbank.project.model.Comment;

import java.util.List;

public interface CrudCommentRepository extends CrudRepository<Comment, Integer> {

    @Override
    Comment save(Comment comment);

    List<Comment> getAllByArticleId(Integer userId);

    @Modifying
    @Query("DELETE FROM Comment c WHERE c.id=:id AND c.userId=:userId")
    int delete(@Param("id") int id, @Param("userId") int userId);

}
