import { env } from "$env/dynamic/private";
export async function load({ fetch }) {
  const response = await fetch(`${env.API_URL}/get-walkers`);

  return {
    walkers: await response.json(),
  };
}
