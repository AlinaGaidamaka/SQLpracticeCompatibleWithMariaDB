SELECT Category.id, Category.title
FROM Category
WHERE Category.id = 3;

SELECT Member.userName AS 'Users', Comment.commentLine AS 'Comments', Comment.commentTimeStamp AS 'Time'
FROM Comment
JOIN Member ON ( Member.id = Comment.memberId )
WHERE Comment.ideaId = 1001;

SELECT Idea.title, Idea.creationDate
FROM Idea
ORDER BY Idea.creationDate DESC;

-------------------------and much more can be done------------------------------
