export async function load({ fetch }) {
  const response = await fetch("http://localhost:3001/get-pets");

  return {
    pets: await response.json(),
  };
}
