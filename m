Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8836D84BD
	for <lists+nouveau@lfdr.de>; Wed,  5 Apr 2023 19:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BA410E226;
	Wed,  5 Apr 2023 17:17:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Wed, 05 Apr 2023 17:17:01 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B310E226
 for <nouveau@lists.freedesktop.org>; Wed,  5 Apr 2023 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680715017; i=markus.elfring@web.de;
 bh=9vk/wCzM3misVERGO6hb9HrWR0a3YXKHA6xQqnouWCQ=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=uH+IOF6NZJzUzlAY/nIjft7Jcyv6Sfg4QK/Gr/HV3V3WNHgn5vqe0z1Z5FDv2GrXE
 wETSjIz2Dh670MEBa51cMWjvGB4yxM/Tl6qjFu0RmuJvqoKQs4EZ50qcxScQVv+h4x
 faf4Os22VUup75XkgCZIGfTj2w/Xrz57fMMASqMMMX1cIyzTZpA1LfVY/fLQtWgCTQ
 ENV8n2IWHkZzuWh9z4V2KYZMYl4AYJsXdiGn4KbAFNk9cMx/BB3ezepdOu0LUjpykC
 2cBCNJHg35EoW4Tn7DohgDOR6R8Py27cuxJQYX6xEV4H/FwluHTXhi4/OVqsOT4l3v
 JVX/U3Mvgic3w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MeDQj-1qILI72BUd-00b5xo; Wed, 05
 Apr 2023 19:11:28 +0200
Message-ID: <809905c6-73c0-75a6-1226-048d8cb8dfda@web.de>
Date: Wed, 5 Apr 2023 19:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <8f785de5-ebe2-edd9-2155-f440acacc643@web.de>
Content-Language: en-GB
In-Reply-To: <8f785de5-ebe2-edd9-2155-f440acacc643@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qFv9xlk5AIOZ4GNsZRuSxSI/E015NJ+DKcMIB1asBsWst+GZ9/L
 zvT37d2pqq0s34WFIYKlbjJYZgDSOae6KVPUa3i/3ehI6dj25z3znMmCZ7Cp69353WUbi/R
 jcopn7CZBTZZH5LnuliQ99wKse4OjXV3Oc64ZM61hwhGfUMVQCbNN49nRBVstujkxIbKFGh
 EWCOiezCC4SavgHuoqFEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6EWKI+nQuIc=;ykfgNuYJqDF1PWBDEpgvkfBLcmn
 0fymosMtkBRT/Qax/eZIteYn8Ji5ZlSjbsyiLkFAFcupmwLMGIgHtmMQsqZmz4YJLbB24wLQn
 IQbzS/iFBEoToPPOmgezeq/BxIPafkW2mbF6JRom/UFSmtYJgCeAzhNiVgCVeKNqekzVlWl5W
 IHEWrbO/GWpWumBQ3Ro0Cf3WEKZTaApvaCc0+LffudqQiVPozZQiSKJ+4N4rmJbw1c/MmBxnv
 7KxOV0Ml7tIzWhDQB/eSeYvbA5Z+kumIpmV5Y96ukbHzdQwr0FR4oouKY7uU5zIKhxteYKqnD
 oK+xJaARJr5BaLmWBUErv7RP0GK6fr1+Tgv+IWjFgHOF53yw11tZe9WT8ZkW/B5x0Dw6gDPsI
 8r5srPa4UxUvaM7euxieqc5W7bIHZMCanalKYYo/aMQEvyvD4BfDsbY/x0aCkp09KZ+bRaIN+
 IsxyV5tqzzAv4jhMeF0je3H5hABaXME+iJcKKG5MaUccV8dRlwW+E3flNptqlCFuTDVpQzrr6
 Q3hpp+tbIfOf3RElB4wWrIpcLACa7FbCqrrFoLeR1vWKHUkdjK4z4KuVAxd4DVSm6wgl25PUs
 NxDeBGHp3BPWmdxYa0xpgGqSBQVx18v+YbVvldGR9lvgdSmEA94rY9DQv5Xzx/0lOs4iatkAt
 OP8fCU26Zc6OrPURPGOtHyc3bPz6AKlUZxtxbDgPuxcXWe6UKydu//BYBns/voLNDoQCghQlx
 jeRi7ZIDJwSSGPUEz2ftF2QbHGrjzE4RWx8V3UDQisaE2gVdIArPI+vbfgK6br23B5y4FBGxm
 69vSOHyXzzMwkb4XjKNGrvHqBrfry267HFToZjt51nXy50Xou+kbhWUANnjMraX0bwXYmdnoC
 E/kPu99U472hm2KAxlt/c9Wc5bKDzXQxh5jKgd5xcndgJHbluVvkkDGdt
Subject: [Nouveau] [PATCH] drm/nouveau: Add a jump label in
 nouveau_gem_ioctl_pushbuf()
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

Fixes: 2be65641642ef423f82162c3a5f28c754d1637d2 ("drm/nouveau: fix relocat=
ions applying logic and a double-free")
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

