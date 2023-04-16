Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72736E36AF
	for <lists+nouveau@lfdr.de>; Sun, 16 Apr 2023 11:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAD510E2D8;
	Sun, 16 Apr 2023 09:39:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870E210E130
 for <nouveau@lists.freedesktop.org>; Sun, 16 Apr 2023 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681637941; i=markus.elfring@web.de;
 bh=8uHpunreb8Uo0Uleoeb/IuBORjGn6rkAngQmsnHu6wo=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=CPy2JuSM7ZOJI9p75OOOELHfSisOhgI3mgubeHA5gNRQwjb7gYxqR7PfVtQVpm2Bc
 Q4PRBPTgtPW1JzZU3Kvg8fFn5rUa9axPOHfQ5RtI5n0M0KRh7r3C0mvz0V3jQg7y6N
 sa8GEXRK84L9ieKJUQPUMgdTmildR5Cl1AUvPYYvHavr9Ac4KnUQxCL7WZCcok9W1T
 0I91nRl3qIqk4GoD/E6iqyKXXVTiqRGVELTl5EfiEC/ut31RTDYNEoXJDKeOQ6o334
 9xAJBcHKTd9qL/YWwwt+cl/OEATK5jvEpG/jmI8ZulKsxOjCzMw08M7gP4PR+oxX9x
 C+1PX3IPe2b+g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsaS7-1qbYVm0bDH-00tdS0; Sun, 16
 Apr 2023 11:33:45 +0200
Message-ID: <1903e057-57d3-e12e-da37-008e23afd2e2@web.de>
Date: Sun, 16 Apr 2023 11:33:44 +0200
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
X-Provags-ID: V03:K1:4oF3Th7JF7y2HCnR8fozd4gR12wECkP6ixJoym1j256YmWiDIVo
 8GgH4sILld65578JRcAcU0gwMo0Bqhm9yfFuy3aU4LPez80+WkLFlNb+mZ1sk/pKTiK+que
 d1iRYCljX6TbqL+5MQ7+Pjz07Cp/Xqvo8DOxxV/na0LIac1BqwyBmnVHbu2AzbIHi0WS/La
 vNUKTLphOY36wAc8QbohQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1aENxpWCNus=;qf4iqrY8BgyggS/G9yde+2+VFb4
 /grH3nmLG8mRX1bdsItSmLkRB7uw/2RAGDepNCJzoXr0rz69JN/B//euVMdfCodta0SVxe+Fy
 BuxbK9+Wttl2xF/p3i7DoNVMjwMrBWvGk9zfqJSBOf8P6ByEacvDmwZkh/RjU+aoG9h01pS2E
 T5r8cHXoNTm4gyWDfWkVQet3dJbLJuskuO3JKDU+p0oxkUW0lRWpTgIb3KQ+LcPLjJkvE8MhX
 HbM98LfvnjgolCu0UoVM9Txhxx65eNkTJnBjcD71K7XS9WRBHYj3YtpBTiLcdF6k1vszIqwpY
 Ir8AElkLtirhtHd+xK3zamjzGl7n6XjJXxRdJu6yAXy5JLdM95BIQyML9R1fAMbrZrHrSKiYm
 TX9BJP6KtPJjVPabFdbJSojoNxvBmHXsuu4myamK0yVqZoLrybwXCfvF7pi/mvtOp+wMAiUa8
 ZomVp1mRXSUlfyZLOItC1y2wteIIkcxiG078sU2hrI5jdW6dWy0hdtp+8E/s7xVqc7JwHyEtY
 XWpHVFtjfhBRvXG7Yyf3V3v0Z28OZUbTz0t6syIAioPzOQGk3Gei+kzctYcP5ieoijaCWhIdP
 KKNMxvbjQYE3XaJli5+lwRWpreCA5vNkZsOGQ9JzuyoDCDgvMptDeIeUnBJGfo3z4ImynhRO4
 4KrX0s7NXOmarthqWQP1ST8q39+X5gjBbM9GLb9NHfvN4b5R17wtWMZmOs2+zKybAmD+DAcDi
 zVnotkI7ErdXazKE199YCQyk1IN3LCoVdECurJmfH9XbmR6MJioS42Rro0Larh5/gFl9opwNM
 q25S7NmyTn/Ak9PKc2TtmkHJBpKnTP0WiaTy1lhhXkCmm/omy71dsgT345wStKoAWLTnL77GP
 Jy+ka3HnWz/fFdGEeWssrR/z1oXw4p1b3FULgesRiz4xWOPUNwCODCYH0
Subject: [Nouveau] [PATCH 1/9] drm/nouveau/debugfs: Move an expression into
 a function call parameter in nouveau_debugfs_pstate_set()
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

Date: Sat, 15 Apr 2023 21:06:06 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cnouveau_debugfs_pstate_set=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the usage
of an expression into a parameter for a function call at the end.

This issue was detected by using the Coccinelle software.

Fixes: 6e9fc177399f08446293fec7607913fdbc95e191 ("drm/nouveau/debugfs: add=
 copy of sysfs pstate interface ported to debugfs")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/n=
ouveau/nouveau_debugfs.c
index 2a36d1ca8fda..44e26b6e74c7 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -144,7 +144,6 @@ nouveau_debugfs_pstate_set(struct file *file, const ch=
ar __user *ubuf,
 	struct seq_file *m =3D file->private_data;
 	struct drm_device *drm =3D m->private;
 	struct nouveau_debugfs *debugfs =3D nouveau_debugfs(drm);
-	struct nvif_object *ctrl =3D &debugfs->ctrl;
 	struct nvif_control_pstate_user_v0 args =3D { .pwrsrc =3D -EINVAL };
 	char buf[32] =3D {}, *tmp, *cur =3D buf;
 	long value, ret;
@@ -188,7 +187,8 @@ nouveau_debugfs_pstate_set(struct file *file, const ch=
ar __user *ubuf,
 		return ret;
 	}

-	ret =3D nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_USER, &args, sizeof(args));
+	ret =3D nvif_mthd(&debugfs->ctrl, NVIF_CONTROL_PSTATE_USER,
+			&args, sizeof(args));
 	pm_runtime_put_autosuspend(drm->dev);
 	if (ret < 0)
 		return ret;
=2D-
2.40.0

