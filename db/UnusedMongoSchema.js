// Import the mongoose module
const mongoose = require('mongoose');

// Set up default mongoose connection
const mongoDB = 'mongodb://127.0.0.1/ProductAPI';
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });

// Get the default connection
const db = mongoose.connection;

// Define schema
const { Schema } = mongoose;

const ProductSchema = new Schema({
  product_id: Number,
  name: String,
  slogan: String,
  description: String,
  category: String,
  default_price: String,
  features: [{
    feature: String,
    value: String,
  }],
});

const StyleSchema = new Schema({
  product_id: Number,
  results: [{
    style_id: Number,
    name: String,
    original_price: String,
    sale_price: String,
    default: Boolean,
    photos: [{
      thumbnail_url: String,
      url: String,
    }],
    skus: {
      increment: {
        quanity: Number,
        size: String,
      },
    },
  }],
});

const RelatedSchema = new Schema({
  product_id: Number,
  related_id: [],
});

// Compile model from schema
const Products = mongoose.model('Products', ProductSchema);
const Styles = mongoose.model('Styles', StyleSchema);
const Related = mongoose.model('Related', RelatedSchema);

module.exports = {
  products: Products,
  styles: Styles,
  related: Related,
};
