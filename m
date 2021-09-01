Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A63FE4CA
	for <lists+nouveau@lfdr.de>; Wed,  1 Sep 2021 23:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AC6897E9;
	Wed,  1 Sep 2021 21:19:05 +0000 (UTC)
X-Original-To: Nouveau@lists.freedesktop.org
Delivered-To: Nouveau@lists.freedesktop.org
X-Greylist: delayed 1024 seconds by postgrey-1.36 at gabe;
 Wed, 01 Sep 2021 21:19:04 UTC
Received: from m-03.smrt1.linuxpl.com (m-03.smrt1.linuxpl.com [178.63.127.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED7B897E9
 for <Nouveau@lists.freedesktop.org>; Wed,  1 Sep 2021 21:19:04 +0000 (UTC)
Received: from [136.243.64.71] (helo=s29.cyber-folks.pl)
 by smrt1.linuxpl.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <przemo@firszt.eu>) id 1mLXMs-000aaf-5W
 for Nouveau@lists.freedesktop.org; Wed, 01 Sep 2021 23:01:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=firszt.eu; 
 s=x;
 h=MIME-Version:Content-Type:Date:To:From:Subject:Message-ID:Sender:
 Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8YUs2mpmWbmY2kB6FuAVCE2PjwktdDIYajAiwsOQ5xI=; b=ZsSDDW6m85tqDEKf9kPHnP0wRC
 6Lf+9tbA7wHv0ANIgEQrit4zebFNOY/ZX3c7QppO4FA84sgXkWE27wQlWXUCpqO+Uoox4Y9YsFFX0
 Wys+lXHkRf2UU6T1BFdu3aiSb7eIrZaDgXXy4gqi2hO3+VLk7x97PQecScrT6omq2W+yUPRtTuU57
 0FM69nzyeBWIcZhSySdhLTKusRqxZBHkwTXZRcB9anM0r3wkxucWNcYcBRanzctVlMCMhLy9PDMcp
 s0Yux/2eQtJ10HKSDRl/15B/OimqdnFcerWfiaJJDNioPjlyzug9uDrj2LERdmIN73hnxnwM80b6t
 Dmq2JKXw==;
Received: from [109.78.28.199] (helo=[192.168.1.156])
 by s29.cyber-folks.pl with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <przemo@firszt.eu>) id 1mLXMl-0006NL-M2
 for Nouveau@lists.freedesktop.org; Wed, 01 Sep 2021 23:01:55 +0200
Message-ID: <d9e232668dee230a02206baf2c528c67b9c1ec6d.camel@firszt.eu>
From: Przemo Firszt <przemo@firszt.eu>
To: Nouveau@lists.freedesktop.org
Date: Wed, 01 Sep 2021 22:01:57 +0100
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-5HvwpvJqQbEL5L+sjsw6"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Subject: [Nouveau] RTX 3070 / NV174 / GA104 - is there any development
 happening?
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--=-5HvwpvJqQbEL5L+sjsw6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Can you advise if there is any work happening on NV174 / GA104 (market
name RTX 3070)? I checked the features matrix and searched the code of
kernel, mesa, libdrm and xf86-video-nouveau. The only thig that seems
to be ready is kernel mode setting and the only piece of code showing
any results when searching for the code names is the linux kernel:

$ grep -ERi 'ga104|fv170|fv174'
grep: linux/.git/objects/pack/pack-
ab4e07c9b3c4ddb7ed2970684121a5c4b7ddfb1d.pack: binary file matches
linux/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c:	.name
=3D "GA104",

Is there any developmen happening in the public space? I'd like to
support it (coding, testing, donating money) as I have a laptop with
that card.
  =20
--=20
Kind regards,
Przemo Firszt


--=-5HvwpvJqQbEL5L+sjsw6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEES47+VVWiUx0l5J35NDc3r6iXFhsFAmEv6kUACgkQNDc3r6iX
FhvGuQf9EiRaCHmMG2FzuB7E0GOBofh8dN47jU3ODdbIrfLYM+JujkA6nYyhY/JV
m+aebGJPrkufOxmTDpe9SGAmcLwTPJVSLpBB25Unu8QxhD8eU2b3RyaeXgCEll5z
Wn75vSKmVodksV9YJaTkiG9kMQzQ8tHIFVsGihveOD9jsFqiyAo48rQvBsm0Uo7z
NqG/99CrrREboAHSfNaWGfj6EKEeMm8/IlNKhl+xpyGycq+P8j2i5gFzvjU22j/D
RR38b+YAU+Qv74CJPLySksGxprlC6q/JVr1teuNn7NvmHqOx2SxqU+PYDL2YwbE0
rCzyuPOJMpvAH7fkaelM1tApvkRzag==
=FeeO
-----END PGP SIGNATURE-----

--=-5HvwpvJqQbEL5L+sjsw6--

