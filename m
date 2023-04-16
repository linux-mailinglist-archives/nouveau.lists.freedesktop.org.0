Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA816E36B4
	for <lists+nouveau@lfdr.de>; Sun, 16 Apr 2023 11:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC9E10E2E2;
	Sun, 16 Apr 2023 09:41:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957A310E2E2
 for <nouveau@lists.freedesktop.org>; Sun, 16 Apr 2023 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681638092; i=markus.elfring@web.de;
 bh=VbiCcvFD+Qi96Uu3AYsuuKIDaQ41gEUacwhrpgjbDtQ=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=XVBlAQOYOJBZ/s0JjYTtr/TxyXIASHVz6BprYNyZw8sKpFQob94N3SOh+db+26+B6
 7SnaSjN87dLufMPJhTXdAa6EkedpTWihsLa9xUA4ZVldiFssFM7cIMaRp4F7ooyejG
 QbNnuplBkBTkH1g9NvP/CpI8Undxn1lzfZtrxcwm9pzLodpAbDaPaEhxSiec3LGgXo
 v5098yxWxQKl42u6JGgABooRaB5zJ1XFf6AKDoI57FQYHXbi4JPkLOZCSzgz94w2VX
 ttNCVbiKS+wa0+b0LLVVf2DOdKstNDuw27PRQoTAVhcnt0tJtPEvTN1sX5inQuBU3C
 Qd0vJtiZlfGVA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4fW-1pcTYe2hli-00C1jS; Sun, 16
 Apr 2023 11:36:18 +0200
Message-ID: <5b7b99f7-1692-74e5-4b1e-cfa14dad7c57@web.de>
Date: Sun, 16 Apr 2023 11:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AJ9D9+EKDgZDPgbcMafxaHj4mOgWlvC+BvY25gB1NZGB6gNVx+O
 xhlki1nbLNhebMQqVZC12o1VYHnC/hTtQPF1DAizUyk2o7v3fn2fPTUi/m+RNs0cM8+MNFf
 ohoDmlpNTR62CxT6BFNOCtonYB30A9B+2zGYwJaAbi6U2WStWeJhow8NUeolN5fEtVgp6P3
 RRdDPeBeF+6FzYAzg1i2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nOy3efXdRWs=;6Ze/pKz000AeCbOgES8VQCM7IF1
 vXLcJI/GO75QjcVIKnOTXVf0PmSsTL4zEfCBZIlBEv4tQEb+paIVZkPS6uqK8XHtF/uW4faqR
 RLyUFGvuFQl0REbJq9DoQacgbM6j7SwgPAHkX+VIX+kPS5py3zvXf9Tygo1gIgFKhSr7t6+SN
 5sWP48lfW+Y59OEbwlB0NwBRupXK255XWggT9bmtpiX4mnlivF7Jox/ECZsm9llvJ2xUFSxfV
 L74ca+WLS5aX4kRy+drz8sue9MB4amxT9k/n3b0WUZTz5q+KntKcWrr/0sVsq57veJEo13yPu
 LLaSFIP1BHys78SemzLTWyhOTbWmCB06Fa+j/iqFrg7JHDFfuqpBAow4Ybv6lKtazU5qkg1pG
 QqZyrCmC8jJCTn3nh332ovMyRcq9FH1lMnvhn1jRqvGtpYZQnW2ah3ZAjAt6vHUbTjR+NGJQG
 7sVZmnhP1DFHK3SBZvFeW4hThiv1hJHOIdTD3jgchQt6EQApBgn90sxTC0J+WL1HfQFS3SCe0
 SD4QOaZa6CqKV6flKH8wBvUmfxV95vAj7XeUcA9kFsbSKmzKob9hza5OWtyQ+Ktjd6DhaW82s
 jtNVi+FimO+pMAM4WqnoaOmukRQQuGfJkINb3nGmbmqsm+ChbQm5959uypi1xcvRVN1ucQ04J
 H6ncExQWwy1JhSpnMg0B6OoqI3+aP32CWW1JLv+pAuVEvRPJlEntOZO0PnmYS7ypSyNIcSFcJ
 YwJalWrFi2BCdkOs7wKNWwwCyJAIl4Iekk9gwwB6bH430UyBNBPqcWVLwzpl8Gx944lG9DdS6
 blzIXrn5s1Fwb/eEuuWg4jvGjgv6tu7BHAcDohw1c8HmBtuJmD+wMNeiRHrfatSwRcRvTvtvA
 F9xeqEHRGtnMzIx4qX/KeW5o/maP9IZWCPbPEMmsqba7fBVq3pzRLiAOs
Subject: [Nouveau] [PATCH 2/9] drm/nouveau/debugfs: Move a variable
 assignment behind a null pointer check in nouveau_debugfs_pstate_get()
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Date: Sat, 15 Apr 2023 21:24:43 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cnouveau_debugfs_pstate_get=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cctrl=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: 6e9fc177399f08446293fec7607913fdbc95e191 ("drm/nouveau/debugfs: add=
 copy of sysfs pstate interface ported to debugfs")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/n=
ouveau/nouveau_debugfs.c
index 44e26b6e74c7..a859a086f308 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -73,13 +73,14 @@ nouveau_debugfs_pstate_get(struct seq_file *m, void *d=
ata)
 {
 	struct drm_device *drm =3D m->private;
 	struct nouveau_debugfs *debugfs =3D nouveau_debugfs(drm);
-	struct nvif_object *ctrl =3D &debugfs->ctrl;
+	struct nvif_object *ctrl;
 	struct nvif_control_pstate_info_v0 info =3D {};
 	int ret, i;

 	if (!debugfs)
 		return -ENODEV;

+	ctrl =3D &debugfs->ctrl;
 	ret =3D nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_INFO, &info, sizeof(info));
 	if (ret)
 		return ret;
=2D-
2.40.0

