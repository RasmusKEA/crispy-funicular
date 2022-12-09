const neo4j = require("../neo4j");
const bcrypt = require("bcrypt");

module.exports = class User {
  constructor(node) {
    this.node = node;
  }

  getId() {
    return this.node.properties.id;
  }

  getPassword() {
    return this.node.properties.password;
  }

  toJson() {
    const { ...properties } = this.node.properties;

    return {
      ...properties,
    };
  }
};
