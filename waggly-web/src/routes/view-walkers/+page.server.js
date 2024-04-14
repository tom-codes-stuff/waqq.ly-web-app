export async function load({ fetch }) {
  const response = await fetch("http://localhost:3001/get-walkers");

  return {
    walkers: await response.json(),
  };
}
