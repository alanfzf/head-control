import { redirect } from '@sveltejs/kit';

export const ssr = false;

export const load = () => {
	if (localStorage.getItem('serverUrl') && localStorage.getItem('token')) {
		throw redirect(303, '/machines');
	}
};
