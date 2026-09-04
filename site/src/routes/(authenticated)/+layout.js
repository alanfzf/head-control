import { redirect } from '@sveltejs/kit';

export const ssr = false; // Forces this layout and its children to be client-side only

export const load = () => {
	const serverUrl = localStorage.getItem('serverUrl');
	const token = localStorage.getItem('token');

	if (!serverUrl || !token) {
		throw redirect(303, '/login');
	}
};
