Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C973B5164
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EE36E203;
	Sun, 27 Jun 2021 03:35:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 16 Jun 2021 22:58:00 UTC
Received: from mx6.ucr.edu (mx6.ucr.edu [138.23.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331886E845
 for <nouveau@lists.freedesktop.org>; Wed, 16 Jun 2021 22:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1623884280; x=1655420280;
 h=mime-version:from:date:message-id:subject:to;
 bh=rlua6TfeeN2sXJkC8s+D5ALLnhCcNCnD/0D2Hh1jRcE=;
 b=sh/kPtGjLv4l+JL1OAgsvThBCuRVwv2Fa8xxebO8sICcuRt6v+7IFHUV
 mesyFXHf4vDglB5Zfi7l9QDROnkG3n5njKMwt5gieHt1fhIfXSUmA4SLG
 HNYFpFzlrIuP3XF918ChLCKVz0f731V4umxYDeh659rj8sj0BkqFnFnkA
 7NUpCU9I0q4WwlyD+iwNI6xAn+jNuSTlsVxUY2ox0wVhXUDS+ulJSsW+L
 iY8apKtt/nRxGiEDrIaVmSHDEeboQe7jtwPrvqJawPL2af+UYWe4Bu2VZ
 OHX2ueEAZFFWcTdhYesCBLISqIoRB+MVPdPrxDxy8l+dW/fC+AI/IRbze A==;
IronPort-SDR: hSg0F+ttsx6ru4WD8CtjW5gS2wDiniITVV8wn7C1J8/KDaF2isPHPk0Oa13SOOHDJAF+fIHCeU
 3PpaaJ2/I6ZlH1IPHIkzrwtQ4g2doG72uiNAgDfPCoEfz/Q8o93wpKsyBgy/BHNKPDHrmxLlVj
 NHmFoZuXG9USO2OCfi8QLGPRnpcqjp6Ijvazl15gDVehJbsQn01IODe2fKmMjUoyy7DC5AzBfG
 VE/xSyZb56bR/yID5CBd9FJvKvbsSmhwfEHwwqAXmMcO8aoTx2MM5I29Cm+TJUf5vcnbNbPqMP
 7A4=
X-IPAS-Result: =?us-ascii?q?A2GDAgA+f8pgf0bYVdFagQmBV4N4bIRIlSkBmCWBfAIJA?=
 =?us-ascii?q?QEBD0EEAQGHPQIlNAkOAgQBAQEBAwIDAQEBAQUBAQYBAQEBAQEFBAEBAhABA?=
 =?us-ascii?q?W6FL0aCOCkBhAURBHgPAiYCJBIBBQEiARIihVcFmFOBBD2LMn8zgQGIFQEJD?=
 =?us-ascii?q?YFiEn4qhwmCZ4QhgimBS4I3dIdbgmQEgxwBehODdgEBAZAsjg6cZAEGAoMEH?=
 =?us-ascii?q?J15K6VrAS2VKaRTECOBMYIVMxolfwZngUtQGQ6dDSQvOAIGCgEBAwmJUQEB?=
IronPort-PHdr: A9a23:H7UMvRRGwPpYalZq4KP8JC9Wj9psoiWfAWYlg6HPa5pwe6iut67vI
 FbYra00ygOQDMOAsaMP2rqempujcFRI2YyGvnEGfc4EfD4+ouJSoTYdBtWYA1bwNv/gYn9yN
 s1DUFh44yPzahANS47xaFLIv3K98yMZFAnhOgppPOT1HZPZg9iq2+yo9JDffgFFiCCzbL9sK
 Bi6ogHcu8oLioZ+N6g9zQfErGFVcOpM32NoIlyTnxf45siu+ZNo7jpdtfE8+cNeSKv2Z6s3Q
 6BWAzQgKGA1+dbktQLfQguV53sTSXsZnxxVCAXY9h76X5Pxsizntuph3SSRIMP7QawoVTmk8
 qxmUwHjhjsZODEl8WHXks1wg7xdoBK9vBx03orYbJiIOPZiYq/ReNUXTndDUMlMTSxMGoyzY
 YsBAeQCIOhWsZXyqkASrReiHwSgGP/jxiNKi3LwwKY00/4hEQbD3AE4Hd0OsXXVrNXoNKcVT
 Ou6z6nIwi/Cb/hL3jr86InJchA7rvGNQb58bcTcxFIyFwzZlFWcs5LqMC6I1ukUtWWQ8uVvW
 /61hWE9twFxviagxt0qioTRh48Yzk3J+Dt3zog7ONC1VU51bcC5HJdOsyyWKop7TMwgTmxnp
 io3y6MKtJqncCUE1JgqxRDRZ+GJfoWU5h/uWuCcKip7inJ9YL+zmQq+/Ey6xuD/VsS4ykhGo
 jdEn9XWtH0Byxre4dWdRPRn5EeuwzOP2hjW6uFDPE87i7LWK4Ukwr4sjpoTtlnDHjPulEX2k
 qCWckIk9/Ct6+v9Y7XmooaQN5d2ig3jK6gulM6yDfgiPggBWGib/uu81Ln98kHjXLpKifg2n
 rHYsJDcO8sbura0DxFJ3osn8RqyDDer3M4GkXUaLV9JYhCKg5TxN1HLOv/4DPO/g1q2kDdsw
 vDLJr3gA5TNLnfZkbftYapx5kBHxQou0d9f/YhYBa8cL/LuQkPxrsDXDgclMwyoxObqENN91
 oQDWWKRHKCWKr7SvESM5uIuOOmMeJQVtCzzK/g/+fHhk2I2lkEGfamqwZsXb2i4Eu5hI0WDb
 nq/yusGRG0RvQcxQ/fCklCOUTdPIX21WuZ0yjglCY7uJIbZQoGgyOiI3T2/H5BaTmRHDE2cV
 3blIcHMd/4KaS+WavFsjiAJT/D1R4Yn1ByqnAH01L5jaOHUrGlQuYjikdR4+eDXvRUz7iBvS
 cqH3myBQnp3gmQQATgs0+Q3p0tg1FqKzIB8gudEDppd/f5EXgohNoLb16p9Ed+2EgbAeMqZD
 VWrWNOrBRkvQd8rhdwDeUBwH5OllB+Q8TCtBuoklq6LGZt8wKLV3jClNtR9wneejPIJklI8B
 MZDKDv11eZE6wHPCtuRwA2inKGwePFZhXaVnFo=
IronPort-HdrOrdr: A9a23:8xK1haGMAN8lRYXHpLqE4ceALOsnbusQ8zAXPiFKOHtom6Oj5q
 OTdZggtSMc6wxxZJhDo6HjBEDoexq1nqKdirNhWItKMjOW3FdA77sO0WIh+Vfd8uHFmdK1HJ
 0NHZRDNA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="222916928"
Received: from mail-pj1-f70.google.com ([209.85.216.70])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2021 15:50:53 -0700
Received: by mail-pj1-f70.google.com with SMTP id
 om5-20020a17090b3a85b029016eb0b21f1dso2724015pjb.4
 for <nouveau@lists.freedesktop.org>; Wed, 16 Jun 2021 15:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W8sgVYgsWMdUE1wHeIEoHud9eQP11SIxXPuwjP87UZw=;
 b=kERj1magj/y0Q3dBdPi9252+9XthFdNskXWTc9vwHnMCuTs2bzUKZs+SLlfxdHR+yN
 o80W3e3HbR/7NkZxnmjPQBL0jLgbbMSMx38s8T4E9pcDDAcw76bPucagqLNAkB4QLBgL
 rex5JjoqJIoJi7qnRFZpPkMDhLnNsEXNTunvE+UO6KgS8N82yPEP+zWKuvAft2bWkouf
 vwxjOtSjTZIuKftizZl+kJOx9Lj6FUVyRzHNSVOxqPnqt4epQgJAo8rjARJDn9YU1ugD
 la565RO4cMRqgu6Ay3NaqH5shLQaFhG46coOo10djSDlJBhlaKGCVXpnytsst+3ehTNC
 6slw==
X-Gm-Message-State: AOAM532ZAxWERr1AgwoYRxi1HrnTpqDInrq3oIEaYmvryX2ZSz7Gi1KB
 j0P9ZGiI1AfyGTjwOi4IC6WcOwjpHBh02n+q6uFRf5cYzwly8iBZ0kxT5/ZUxWYq47U26VgFcKY
 SQaEoPypBtZLTgb/wQYdDurEnEJr6PMomtWNamSK2Cos=
X-Received: by 2002:a17:90a:d516:: with SMTP id
 t22mr2289218pju.144.1623883852458; 
 Wed, 16 Jun 2021 15:50:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpBspB9QJdH+f58DOOAFndNmFeCe7X2gL2GM2hO1VVOXQa23XnJmXHTZeZxwy2XrHghuDEEc/1KtDqeJG9FZY=
X-Received: by 2002:a17:90a:d516:: with SMTP id
 t22mr2289201pju.144.1623883852186; 
 Wed, 16 Jun 2021 15:50:52 -0700 (PDT)
MIME-Version: 1.0
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Wed, 16 Jun 2021 15:50:41 -0700
Message-ID: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
To: bskeggs@redhat.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:45 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/core: fix the uninitialized use in
 nvkm_ioctl_map()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In function nvkm_ioctl_map(), the variable "type" could be
uninitialized if "nvkm_object_map()" returns error code,
however, it does not check the return value and directly
use the "type" in the if statement, which is potentially
unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index d777df5a64e6..7f2e8482f167 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
                ret = nvkm_object_map(object, data, size, &type,
                                      &args->v0.handle,
                                      &args->v0.length);
+               if (ret)
+                       return ret;
                if (type == NVKM_OBJECT_MAP_IO)
                        args->v0.type = NVIF_IOCTL_MAP_V0_IO;
                else
-- 
2.17.1
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
