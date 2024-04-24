var request = require('supertest');
var app = require('../index.js');
describe('GET /about', function() {
    it('respond with Devops', function(done) {
        request(app).get('/about').expect({ "message": "This is basic project to learn DevOps." }, done);
    });
});