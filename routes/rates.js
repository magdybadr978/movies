const router = require("express").Router();
const util = require("util");
const connection = require("../DataBase/movies_DB");

router.get("/movies/ratings", async (req, res) => {
  try {
    const query = util.promisify(connection.query).bind(connection);
    const data = await query(
      `select count(movie_id) as count ,movie_id 
       from thecamp_movies_ratings
       group by movie_id`
    );
    res.status(200).send(data);
  } catch (err) {
    //console.log(err);
    res.status(500).send(err);
  }
});

router.post("/movies/ratings", async (req, res) => {
  try {
    const query = util.promisify(connection.query).bind(connection);
    await query(
      `INSERT INTO thecamp_movies_ratings(movie_id,movie_review)
       VALUES (${req.body.movie_id},"${req.body.movie_review}")`
    );
    // const data = await query(
    //   `select movie_review from thecamp_movies_reviews where id = ${req.params.movie_id}`
    // );
    res.status(200).send("post added successiful");
  } catch (err) {
    //console.log(err);
    res.status(500).send(err);
  }
});

router.patch("/movies/ratings/:id", async (req, res) => {
  try {
    const query = util.promisify(connection.query).bind(connection);
    await query(
      `UPDATE thecamp_movies_ratings
       SET movie_id="${req.body.movie_id}",movie_review = "${req.body.movie_review}" where id = ${req.params.id}`
    );
    res.status(200).send("update successiful");
  } catch (err) {
    console.log(err);
    res.status(500).send(err);
  }
});

router.delete("/movies/ratings/:id", async (req, res) => {
  try {
    const query = util.promisify(connection.query).bind(connection);
    query(`DELETE FROM thecamp_movies_ratings WHERE id =${req.params.id}`);
    res.status(200).send("deleted data");
  } catch (err) {
    res.status(500).send(err);
  }
});

module.exports = router;
