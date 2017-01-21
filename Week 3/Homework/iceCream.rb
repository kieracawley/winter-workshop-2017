brands = {
	"Noah's Ice Cream" => {
		"owner" => "Noah",
		"location" => "NYC",
		"website_url" => "http://www.noahs-icecream.herokuapp.com"
	},
	"Friendly's Ice Cream"  => {
		"owner" => "John M. Maguire",
		"location" => "Wilbraham, MA",
		"website_url" => "https://www.friendlys.com/ice-cream/"
	},
	"Baskin Robbins"  => {
		"owner" => "Burt Baskin and Irv Robbins",
		"location" => "Canton, MA",
		"website_url" => "https://www.baskinrobbins.com/content/baskinrobbins/en.html"
	}
}

ice_cream_flavors = {
	"standard_flavors" => {
		"chocolate" => {
			"cost_in_cents_per_ounce" => 20,
			"amount_in_stock_in_ounces" => 500000,
			"brand" => brands["Noah's Ice Cream"]
		},
		"vanilla" => {
			"cost_in_cents_per_ounce" => 15,
			"amount_in_stock_in_ounces" => 90000,
			"brand" => brands["Friendly's Ice Cream"]
		},
		"strawberry" => {
			"cost_in_cents_per_ounce" => 15,
			"amount_in_stock_in_ounces" => 450000,
			"brand" => brands["Friendly's Ice Cream"]
		},
		"mint chocolate chip" => {
			"cost_in_cents_per_ounce" => 20,
			"amount_in_stock_in_ounces" => 120000,
			"brand" => brands["Noah's Ice Cream"]
		}
	},
	"special_flavors" => {
		"rocky road" => {
			"cost_in_cents_per_ounce" => 40,
			"amount_in_stock_in_ounces" => 120000,
			"brand" => brands["Baskin Robbins"]
		},
		"chocolate marshmallow swirl" => {
			"cost_in_cents_per_ounce" => 60,
			"amount_in_stock_in_ounces" => 120000,
			"brand" => brands["Friendly's Ice Cream"]
		},
		"chocolate fudge" => {
			"cost_in_cents_per_ounce" => 35,
			"amount_in_stock_in_ounces" => 120000,
			"brand" => brands["Baskin Robbins"]
		}
	}
}

sizes = {
	"cones" => {
		"small" => {
			"size_in_ounces" => 10,
			"cost_of_cone_in_cents" => 30
		},
		"medium" => {
			"size_in_ounces" => 25,
			"cost_of_cone_in_cents" => 50
		},
		"large" => {
			"size_in_ounces" => 50,
			"cost_of_cone_in_cents" => 80
		}
	},
	"cups" => {
		"small" => {
			"size_in_ounces" => 15,
			"cost_of_cone_in_cents" => 5
		},
		"medium" => {
			"size_in_ounces" => 40,
			"cost_of_cone_in_cents" => 8
		},
		"large" => {
			"size_in_ounces" => 60,
			"cost_of_cone_in_cents" => 12
		}
	}
}
toppings = {
	"chocolate sprinkles" => {
		"cost_in_cents" => 50,
		"brand" => brands["Noah's Ice Cream"]
	},
	"rainbow sprinkles" => {
		"cost_in_cents" => 50,
		"brand" => brands["Noah's Ice Cream"]
	},
	"hot fudge" => {
		"cost_in_cents" => 100,
		"brand" => brands["Noah's Ice Cream"]
	},
	"caramel" => {
		"cost_in_cents" => 100,
		"brand" => brands["Noah's Ice Cream"]
	}
}
