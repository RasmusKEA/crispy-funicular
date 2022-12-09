module.exports = class Review {
  constructor(node) {
    this.node = node;
  }

  toJson() {
    const { ...properties } = this.node.properties;

    return {
      ...properties,
    };
  }
};
