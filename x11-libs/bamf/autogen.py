#!/usr/bin/env python3

import json


async def generate(hub, **pkginfo):

	python_compat = "python3+"
	launchpad_name = pkginfo["name"]
	json_list = await hub.pkgtools.fetch.get_page(
		f"https://api.launchpad.net/1.0/{launchpad_name}/releases", is_json=True
	)

	for rel in json_list["entries"]:
		version = rel["version"]
		link_url = rel["files_collection_link"]
	json_files = await hub.pkgtools.fetch.get_page(link_url, is_json=True)
	url = json_files["entries"][0]["file_link"]

	final_name = f"{pkginfo['name']}-{version}.tar.gz"

	ebuild = hub.pkgtools.ebuild.BreezyBuild(
		**pkginfo,
		version=version,
		python_compat=python_compat,
		artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)],
	)
	ebuild.push()


# vim: ts=4 sw=4 noet
