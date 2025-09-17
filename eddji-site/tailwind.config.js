module.exports = {
  content: [
    "./components/**/*.{vue,js}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./plugins/**/*.{js,ts}",
    "./nuxt.config.{js,ts}"
  ],
  theme: {
    extend: {
      colors: {
        eddji_orange: "#b27d00",
        eddji_green: "#20924d",
        eddji_blue: "#417197",
        eddji_gray: "#003061"
      }
    }
  },
  plugins: []
}
