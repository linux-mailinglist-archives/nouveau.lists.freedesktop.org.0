Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACF12438F
	for <lists+nouveau@lfdr.de>; Wed, 18 Dec 2019 10:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00F86E29E;
	Wed, 18 Dec 2019 09:46:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 356 seconds by postgrey-1.36 at gabe;
 Wed, 18 Dec 2019 09:46:06 UTC
Received: from mail.pmoreau.org (pmoreau.org [37.187.98.141])
 by gabe.freedesktop.org (Postfix) with ESMTP id BDA6B6E29E;
 Wed, 18 Dec 2019 09:46:06 +0000 (UTC)
Received: from pmoreau.org (unknown
 [IPv6:2a01:e35:2fd7:d5a0:a93f:fcc7:d652:2bb2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: eiquom6u@pmoreau.org)
 by mail.pmoreau.org (Postfix) with ESMTPSA id 891B7A402E4;
 Wed, 18 Dec 2019 10:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pmoreau.org;
 s=default; t=1576662009;
 bh=pZB/4Pq9zR//igFBLVLFUG3LfAaSbg4uGMb1r+AeybM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=pAzu+duNkjD+eE+SylXpHV85gABz4RMusFzGWYIeeLnqr0wsi6/7SJU+lYQ/wPY3m
 HYHNuDNd87FrUklc74U3q5Q9MdAVAwarDanxg+rpP4PectiwjKK/aA08vi8J/k5R43
 1uJsjiPZ+rfYS0TXFtHZw8i7PVsScgw5pAuM0g/A=
Date: Wed, 18 Dec 2019 10:40:01 +0100
From: Pierre Moreau <dev@pmoreau.org>
To: zhengbin <zhengbin13@huawei.com>
Message-ID: <20191218094001.umqwylosqwdjb34k@pmoreau.org>
Mail-Followup-To: zhengbin <zhengbin13@huawei.com>, bskeggs@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <1576632483-140210-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1576632483-140210-1-git-send-email-zhengbin13@huawei.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau/mmu: Remove unneeded semicolon
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, daniel@ffwll.ch
Content-Type: multipart/mixed; boundary="===============0686066932=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0686066932==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3hr33hrvabci5dvp"
Content-Disposition: inline


--3hr33hrvabci5dvp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Pierre Moreau <dev@pmoreau.org>

On 2019-12-18 =E2=80=94 09:28, zhengbin wrote:
> Fixes coccicheck warning:
>=20
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:583:2-3: Unneeded semicolon
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:307:2-3: Unneeded semicolon
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
> v1->v2: add missing one space after the closing curly bracket
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 41640e0..199f94e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -580,7 +580,7 @@ nvkm_vmm_iter(struct nvkm_vmm *vmm, const struct nvkm=
_vmm_page *page,
>  				it.pte[it.lvl]++;
>  			}
>  		}
> -	};
> +	}
>=20
>  	nvkm_vmm_flush(&it);
>  	return ~0ULL;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/vmm.h
> index 5e55ecb..321bfca 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> @@ -304,7 +304,7 @@ int tu102_vmm_new(struct nvkm_mmu *, bool, u64, u64, =
void *, u32,
>  		FILL(VMM, PT, PTEI, _ptes, MAP, _addr);                        \
>  		PTEI +=3D _ptes;                                                 \
>  		PTEN -=3D _ptes;                                                 \
> -	};                                                                     \
> +	}                                                                      \
>  	nvkm_done((PT)->memory);                                               \
>  } while(0)
>=20
> --
> 2.7.4
>=20

--3hr33hrvabci5dvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEej50sMo3avjoHMecTsmfhA5fDzsFAl358+0ACgkQTsmfhA5f
DzvqcRAAy8qC6dBW9EmMPY2xRDSnuA9S6wmgNM4GTplv+bZ784EypOTut68sDdOg
hD52QwTc4h1B7gkslvZZz32LZp1+Fn9rf1Qo+n16xhleHpiXCSapC9R8TXy1Fg1p
dw6403Ob7WmUkmlUA8D5c+gzR5m4trLfMjWD0YGxZQxZ/AyDAuCA7X+gCy9deYaK
sPnwKfJovZ+7PKp+C8ieqR3wd6MeAjdfgiy6j+0dksJ5FFD3ulAI0Qa2/kQvPLk8
gbiVwPpznmEdEFdDTxmYTA5ARYb+x0o2BvAGzf+Z1UEG/ISGskeeArwaTKLdRMvE
mOWZY/8NTkwKwMMHYX162YKAyCl+b6RgussuOto7FyxGT5P2eWxWAPrs0GlTbVv1
JGvPtUNeBxQF37OeMi1yW0749gBpuPLrG7QwEvEHOataLGESK5K0CL/uHrV4kp9h
MZNbc0lyBC0j6qcFtNLPqV75iwgrURnzKIcYZSBkAj7CgVnuY2CMECtPfv5++Y7Z
UymBnN/mc69V3o4R4SXdxN6odrmliOQjQWsiUQbcFV6CKT0mGODiPKVlnmI/yk2A
O9CgSohUJLPhvbt93Ic/hwO+QufcKhMy6lVVkaTldGbKot/7qGycp/8UwKF+rYWy
BFhrCba7Kzr8WDD5i+n0VgwVYEc/Lg8QvTiMCUTlFZ0lRMcbh+Y=
=2Y8H
-----END PGP SIGNATURE-----

--3hr33hrvabci5dvp--

--===============0686066932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0686066932==--
