Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4BBBB76AE
	for <lists+nouveau@lfdr.de>; Fri, 03 Oct 2025 17:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FCE10E93E;
	Fri,  3 Oct 2025 15:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="lTMLIBJN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Fri, 03 Oct 2025 15:56:21 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC16D10E93E
 for <nouveau@lists.freedesktop.org>; Fri,  3 Oct 2025 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1759506972; x=1760111772; i=markus.elfring@web.de;
 bh=IC+cPBrAXR51b3WY9/VmEG5wgSDTu5/PWCsWWe50Jrs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lTMLIBJNcsqu4poj1Ae/Sy7lnaD7Mzc0jJ3n8pgO3JQRrddUIwvWAW15Z5n4m+Zn
 pILFGW/A/JEpRdmgldSZ4jzohO31DCkjP8Ba46xjMoh2rffF56VpMZ+QVzAoHEY0x
 bEDkPtD1pFAu8+kFmkDpkPemXfbctNsefoN2Gge5qLLrfHwW9neDzSO5856VRLLcX
 l3bDyZ3ecXvOpXzGMV7aWGs8/Zxgnr8fnFVBVl5GrohplCeKklXaTuIuOy23FA89n
 ziRGEep+cjOC/3uBp6z+llkNGOaQQw/SNeqNkiile7IqVamUVghaFzV72tOoTW/QU
 f1SXroRBHEJWbdcEeg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.196]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MfKxV-1uNwZz10uJ-00kXFq; Fri, 03
 Oct 2025 17:50:52 +0200
Message-ID: <8f14db49-7523-433d-abf5-156200bcec0f@web.de>
Date: Fri, 3 Oct 2025 17:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandr Sapozhnikov <alsp705@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, lvc-project@linuxtesting.org
Cc: LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <20251002083332.11-1-alsp705@gmail.com>
Subject: Re: [PATCH] gpu/drm/nouveau/nvif: fix a null dereference in
 nvif_client_ctor()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251002083332.11-1-alsp705@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h+nX7oipmgkC9r3V1VNK4OLQcGh2GU6kjNYHb7s9A+xA+8nMqKA
 AC0dXjdZpnLiuI7Tz82HHVTSN1jU+c32JxOfQ7u4cJ0RWKfVuM6Eg9FFVgtvWXOYtVzL06u
 6cPexMWrZQLI7D8mPCTCo2LC0XxqQt/cnAtC6Q0w2qwv5thru5Y+NQFPj2jtqm93dgMd9lM
 nWu40WhZEaXY1Kx+NGbNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6LCPze4tjSk=;azOjhhbP7WuErMe9NSoUJ2JszFR
 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
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

> If the name parameter can be NULL, then you should not do=20
> strncpy before checking name for NULL.

Would a corresponding imperative wording become helpful for an improved ch=
ange description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17#n94

Regards,
Markus
