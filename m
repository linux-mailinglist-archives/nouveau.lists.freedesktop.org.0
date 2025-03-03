Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1BA4CA72
	for <lists+nouveau@lfdr.de>; Mon,  3 Mar 2025 18:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A5510E4BE;
	Mon,  3 Mar 2025 17:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Ekv+zpnG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 337 seconds by postgrey-1.36 at gabe;
 Mon, 03 Mar 2025 17:55:22 UTC
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DF510E3C9
 for <nouveau@lists.freedesktop.org>; Mon,  3 Mar 2025 17:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1741024512; x=1741629312; i=markus.elfring@web.de;
 bh=BYfX7ahdAx14xenhiSbgtax3duc93F62obxPkYvV944=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ekv+zpnGtIePBslInrFJObDh8/Wru2jxfdQ0r8JbSJlx5FFnv+Mtlt+3F7Pac5vn
 Hh+8noAwF7olKks8TID2cGUJc9pcJpF4rdM1eWtYldFFwR/lr0RBj5x1Yq5dktWvM
 L5AWtFV7Ykz29NL6xsnI5ShjMqSdPySSGU5oV1oUg7l+kQnQJLeqUl2qoo5SwUjkn
 WSWs2g41s+1FUZwIHFfcoLflTR1UlyNc9nmJ+QnQijfv2/YpipSVHw+N2X/JJBry5
 x/zk5Hq8P+L53zypUHQEa6VOUZ5+2pI0rOclZDqFgtfipcPVmH9ZOoLNvDejnqgwX
 8jyAu7coOv+yKSGd+w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MuVGA-1syhgU02a2-00vk09; Mon, 03
 Mar 2025 18:49:08 +0100
Message-ID: <684bfc0d-7e1d-40f1-b1b7-d6ed64fcd8b7@web.de>
Date: Mon, 3 Mar 2025 18:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND] drm/nouveau: Add a jump label in
 nouveau_gem_ioctl_pushbuf()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Simona Vetter <simona@ffwll.ch>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <8f785de5-ebe2-edd9-2155-f440acacc643@web.de>
 <809905c6-73c0-75a6-1226-048d8cb8dfda@web.de>
Content-Language: en-GB
In-Reply-To: <809905c6-73c0-75a6-1226-048d8cb8dfda@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E/k+Xgzr03sFsIQP6/rLbeZ9jBhiTPWWxBW6gyeBMvI3JQbgT9I
 +Y4HgV3wwul18HU6cxSHtB8d2/74o/f4jJeELUakevzSrfaT/yrefYE+E69JzCmstH3zI9B
 yCXvBjH/00Ethv40lD4gvrb27rewWNHvaVZD8rEcm6QJqUD39A6qXWVCQM/2UAZMD6auaU/
 Bo+9LSx5ABwtoAYcX8jDw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KQ/o7PdCPpY=;wge++ck9HS3LxVImzHglKYF079n
 LBh8XmnAe7BcXVe7dIZnDEzsRJBnM4ZRBdxnZVJDwTqDBRhodBssu1JA+Jw3RN1PX0ARs3m1n
 wu9Uzp/qXFUNWVwVehHizaMWxzqXj1d86zPNNzI/eHivGpaZ5lRoNohj6N/eMPH10QZ+pRKuj
 oclom9TTL0F8Kdvf2smrmt+S7HBix6noQcivyd1QlUCJuKuSDHpn2ZF5jiLFPLbbEgXBALaxH
 4WoHAvk4eaU0kpVM8zHGUAfFR11wN1YBfZmPdckGUbBqvm4ElfsFCfJBEBcKEB4l3avfdt37P
 z4LW2TzrhLZlbAHz2+yGpek7zvHOnfAI4YZ5fbmEMMnIwCg0Dndi0Wu5ELjJp6QzriwM63axQ
 UI19oZ9gjw3Zh8QEnKQoSDQxY4flYjlZa6wrhPGw6nE7X0h1QfNFmbb5BWEH5p7injgTPixqD
 Gie6fKwOY9pwMqHKW9DIn2/aZXq/YK1J4JkKrqSSdN/jr5h2ijMghupVXtTOyWuk13q1x2vqx
 ZGSidZGf0AOalY5aU/ZqCE0DkJBQ0MZjnE8gZDZ5GDx5QFLMT0WjmFwCfKqWi9ibDZt63yY2J
 vhenIpqVDyZZtGut+7QUWyWIPuXn5EsIgqiV6Vc5V/2veQd7tKlEBtvB6Rz0UfG6JS087TkO0
 vdSaxjqdc3rekzHw8HJOrWw32kcdwQP+4HcG5pMul8sbD/9IpLY1fVHg1NN1vUC2ET3nNjA1V
 GqGmZDDNCypmTswJhYA2fj3btuZyEptPiJr5zqzrZgoL6uyHF1kGH2Glp/OdBock4xXmu894u
 +RfWXWnHy0mgcRXpGTjzenXBqyZLs8/Zp+8nnWnF4+VnQ+t5+CbIpeDN4288oljKRPyLXFkz5
 syr4SJTRTizDz6DtctXZ8c30LGI50aeRQu5rh6g4PCtHIlSorV1MYauVuvI3Tn9PkKeJRrKRG
 fSshCCYX5XaHxcPo3atKzjqv3IZQiDrjbITPxbMrxRubvo//9QADczryOqURoo04faEF6fuD6
 SwA6PocsNCHhWonGbiPxqsK6O5Uv2vIRuuZ6j0+WAXS/xLdqL0XXDbhbWQOF0CZEWxak3Ic/D
 63JeSeT5SBzywes0C4HUj97oGYTYqcyt7zvINihAYK45pbmE8IEdttaGelxqmhNQnP2vPJKAq
 N2BC4tv2InXcVMcxeSEAoyCRqS1Bgc/94fiWDSgX6Ll/6iBGNUcPnFckjPxJB+yHL5crnPXec
 5JDLniY9erhVK8OqpHEd9+bXWDizuHYy+iMhbbVwcEjF0FBu58NI7oVIKnlHBXxx28uWcQ3aa
 TaydnCJ4aaEvd01ylkV11C7eDKG4kq/eQabES0TtJW5YgfABQzLE48/USed/LHXErflTy0mga
 YPl84fz1QV+JcAcm2XadtFzURgC5tRVT7UCugyNBAZIrj3byr3YXyn5XFIFbxYiAu2/4hmQmE
 MmhWtzotJuBd2XfCpygG7njjbwlU=
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 5 Apr 2023 18:38:54 +0200

The label =E2=80=9Cout_prevalid=E2=80=9D was used to jump to another point=
er check
despite of the detail in the implementation of the function
=E2=80=9Cnouveau_gem_ioctl_pushbuf=E2=80=9D that it was determined already=
 in one case
that the corresponding variable contained an error pointer
because of a failed call of the function =E2=80=9Cu_memcpya=E2=80=9D.

Thus use an additional label.

This issue was detected by using the Coccinelle software.

Fixes: 2be65641642e ("drm/nouveau: fix relocations applying logic and a do=
uble-free")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouve=
au/nouveau_gem.c
index f77e44958037..d87e1cb2c933 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -814,7 +814,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void=
 *data,
 			reloc =3D u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc));
 			if (IS_ERR(reloc)) {
 				ret =3D PTR_ERR(reloc);
-				goto out_prevalid;
+				goto out_free_bo;
 			}

 			goto revalidate;
@@ -929,6 +929,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void=
 *data,
 out_prevalid:
 	if (!IS_ERR(reloc))
 		u_free(reloc);
+out_free_bo:
 	u_free(bo);
 	u_free(push);

=2D-
2.40.0


