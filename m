Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44869CBAB6B
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E6610EADD;
	Sat, 13 Dec 2025 12:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="okfSpUKp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 447 seconds by postgrey-1.36 at gabe;
 Fri, 13 Sep 2024 11:32:19 UTC
Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com
 [17.58.6.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B63710E14A
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2024 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1726226691;
 bh=OjgbjKJ8ePomEEUTsZ+wSrryAAYuLrVcsFsL8h9/F6k=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=okfSpUKpwnWiJyMnIDFDX+mu5CY551yKgc50UDPEFIG7WQR95y9tjTNiVRQ2brzVf
 bSI0343NNgeEki4OE5JqXY6GhSp/DnnJzo+ktQ7oY87bQSxA1L61qUV1dTCPVpVfm9
 uZca7OPv90lzNUY4mpmTZjOop5um12+LkY+lJw9j7lmyLSU+oOvQ9/bEFbbBi6A+PU
 64vqYTNZdBPYmynWJ0h+8vPmgRTaWJ3onqKyxgtnRpRD01ezWV00SaA8Y3wp+s3Dtb
 J1ut3DaHv2Tu7coxe6bHvHWI93eyygc73i3zFDLLdGSVmiISvDLMotbx9YhaUGrfG2
 ymClbtspfq8ZQ==
Received: from [192.168.31.220] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 1BBFE4A03E9
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2024 11:24:48 +0000 (UTC)
Message-ID: <c80b78c2-fb29-4996-bf02-52149c9f3d22@icloud.com>
Date: Fri, 13 Sep 2024 19:24:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kimiblock Moe <kimiblock@icloud.com>
Subject: Locking GPU frequency on GSP-enabled cards
To: nouveau@lists.freedesktop.org
Content-Language: en-US, en-US-large
Autocrypt: addr=kimiblock@icloud.com; keydata=
 xjMEZceOOxYJKwYBBAHaRw8BAQdAgSthMh6TJIM5zkC5XFh4f9iXS6FHragDj5mat+bMgY/N
 IEtpbWlibG9jayA8a2ltaWJsb2NrQGljbG91ZC5jb20+wpMEExYKADsWIQQN01jB/BRX8rHy
 TqBCp1dTTVQnKAUCZceOOwIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRBCp1dT
 TVQnKCddAQCa4Yf9ZcXLcFLjr6hscb+ajN8eiAIOTD89CB/4o544AwD/dM3jFiYmEYcB4Rbn
 nP+N/WQwFImaqFJ4lmCDnjCjVQ7OOARlx447EgorBgEEAZdVAQUBAQdAAPqggEFwWz66Q52x
 mowSFknTTFEI6bbRktVcNszxASoDAQgHwngEGBYKACAWIQQN01jB/BRX8rHyTqBCp1dTTVQn
 KAUCZceOOwIbDAAKCRBCp1dTTVQnKMH8AQC8tmDpeOoO3t8HxX2y+E/dUAD+SsUARA0dlZHv
 QU9pMAEAlZIGCQcPGBZaIlUtlQLI2rgFo8ncDCUGDv+0l+swCgY=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a964SMoLJ0ukmsOEUSy5076d"
X-Proofpoint-GUID: HRmolHNCpW_9blCthd4az4zAT8qLkMOU
X-Proofpoint-ORIG-GUID: HRmolHNCpW_9blCthd4az4zAT8qLkMOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_09,2024-09-13_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=568 suspectscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2409130079
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a964SMoLJ0ukmsOEUSy5076d
Content-Type: multipart/mixed; boundary="------------4YUNKeMnmDg628bSr9QnmpsX";
 protected-headers="v1"
From: Kimiblock Moe <kimiblock@icloud.com>
To: nouveau@lists.freedesktop.org
Message-ID: <c80b78c2-fb29-4996-bf02-52149c9f3d22@icloud.com>
Subject: Locking GPU frequency on GSP-enabled cards

--------------4YUNKeMnmDg628bSr9QnmpsX
Content-Type: multipart/mixed; boundary="------------AVtedLXTrpRv0IphyyheoMWJ"

--------------AVtedLXTrpRv0IphyyheoMWJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgYW0gdXNpbmcgYSBsYXB0b3Agd2l0aCA0MCBzZXJpZXMgY2FyZC4gQ3VycmVu
dGx5IGlmIHRoZSBkaXNjcmV0ZSBHUFUgDQpzaXRzIGlkbGUgZm9yIHNvbWUgdGltZSwgdGhl
IGRpc3BsYXkgY29ubmVjdGVkIHRvIGl0IHdpbGwgc3RhcnQgdG8gbGFnIA0KYmFkbHkuIFRo
aXMgcHJvYmxlbSBpcyBhbHNvIHByZXNlbnQgd2hlbiBib3RoIGRpc3BsYXlzIGFyZSBjb25u
ZWN0ZWQgdG8gDQp0aGUgTlZJRElBIEdQVSBhbmQgdXNpbmcgcHJvcHJpZXRhcnkgZHJpdmVy
cywgYnV0IGNhbiBiZSBtaXRpZ2F0ZWQgYnkgDQpsb2NraW5nIHRoZSBHUFUgZnJlcXVlbmN5
IHVzaW5nICJudmlkaWEtc21pIC1sZ2MgMjAwMCw0MDAwMCIuIFRoaXMgc3RvcHMgDQp0aGUg
ZGlzY3JldGUgR1BVIGZyb20gbG93ZXJpbmcgaXRzIGNsb2NrIHNwZWVkIGFuZCByZXN1bHRz
IGluIGEgc21vb3RoIA0KZGVza3RvcCBleHBlcmllbmNlLiBJIHdvbmRlciBpZiB0aGlzIGlz
IHBvc3NpYmxlIHdpdGggbm91dmVhdT8gVGhhbmtzIQ0KDQotLSANCi0tDQpTaW5jZXJlbHks
DQpLaW1pYmxvY2sNCg0K
--------------AVtedLXTrpRv0IphyyheoMWJ
Content-Type: application/pgp-keys; name="OpenPGP_0x42A757534D542728.asc"
Content-Disposition: attachment; filename="OpenPGP_0x42A757534D542728.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZceOOxYJKwYBBAHaRw8BAQdAgSthMh6TJIM5zkC5XFh4f9iXS6FHragDj5ma
t+bMgY/NIEtpbWlibG9jayA8a2ltaWJsb2NrQGljbG91ZC5jb20+wpMEExYKADsW
IQQN01jB/BRX8rHyTqBCp1dTTVQnKAUCZceOOwIbAwULCQgHAgIiAgYVCgkICwIE
FgIDAQIeBwIXgAAKCRBCp1dTTVQnKCddAQCa4Yf9ZcXLcFLjr6hscb+ajN8eiAIO
TD89CB/4o544AwD/dM3jFiYmEYcB4RbnnP+N/WQwFImaqFJ4lmCDnjCjVQ7OOARl
x447EgorBgEEAZdVAQUBAQdAAPqggEFwWz66Q52xmowSFknTTFEI6bbRktVcNszx
ASoDAQgHwngEGBYKACAWIQQN01jB/BRX8rHyTqBCp1dTTVQnKAUCZceOOwIbDAAK
CRBCp1dTTVQnKMH8AQC8tmDpeOoO3t8HxX2y+E/dUAD+SsUARA0dlZHvQU9pMAEA
lZIGCQcPGBZaIlUtlQLI2rgFo8ncDCUGDv+0l+swCgY=3D
=3DMBfY
-----END PGP PUBLIC KEY BLOCK-----

--------------AVtedLXTrpRv0IphyyheoMWJ--

--------------4YUNKeMnmDg628bSr9QnmpsX--

--------------a964SMoLJ0ukmsOEUSy5076d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQN01jB/BRX8rHyTqBCp1dTTVQnKAUCZuQg/QUDAAAAAAAKCRBCp1dTTVQnKBhi
AQC1kN6nGgqv/3ZjgnfIwK9xdzNQmLcZjmD6Vwcth/jJ5QD9Gaod4JntlgXW+lKFs3Ip2dyRoBDC
bhOf0vFm/Cz4KQA=
=Leky
-----END PGP SIGNATURE-----

--------------a964SMoLJ0ukmsOEUSy5076d--
