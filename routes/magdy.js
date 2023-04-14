const router = require("express").Router();
const util = require("util");
const connection = require("../DataBase/movies_DB");

router.get("/movies", async(req,res) =>{
    try{
        const query = util.promisify(connection.query).bind(connection);
        const data = await query(`SELECT * 
        FROM thecamp_cinema
        inner join thecamp_movies_ratings 
        on thecamp_movies_ratings.movie_id = thecamp_cinema.id`);
        res.status(200).send(data);
    }catch(err){
        res.status(500).send(err);
    }
});

router.post("/movies", async (req, res) => {
    try {
    const query = util.promisify(connection.query).bind(connection);
    await query(`INSERT INTO thecamp_cinema(movie_name,movie_length,movie_director) VALUES ("${req.body.movie_name}",${req.body.movie_length},"${req.body.movie_director}")`);
    res.status(200).send("post added successiful");
    } catch (err) {
      //console.log(err);
    res.status(500).send(err);
    }
});

router.patch("/movies/:id", async (req, res) => {
    try {
    const query = util.promisify(connection.query).bind(connection);
    await query(`UPDATE thecamp_cinema SET movie_name="${req.body.movie_name}",movie_length=${req.body.movie_length},movie_director="${req.body.movie_director}" where id = ${req.params.id}`);
    res.status(200).send("update successiful");
    } catch (err) {
      //console.log(err);
    res.status(500).send(err);
    }
});


router.delete("/movies/:id", async(req,res)=>{
    try{
        const query = util.promisify(connection.query).bind(connection);
        query(`DELETE FROM thecamp_cinema WHERE id =${req.params.id}`);
        res.status(200).send("deleted data");
    }catch(err){
        res.status(500).send(err);
    }
    
});


module.exports = router;

