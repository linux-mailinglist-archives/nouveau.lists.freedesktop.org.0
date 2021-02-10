Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF066316510
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 12:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4888F6EC60;
	Wed, 10 Feb 2021 11:22:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9218C6EC60
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 11:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612956162;
 bh=xGnyn2Ve5rJzraiaOOtNY8Cnxa5j1i2c93Pf6DRvJm0=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=foChY842YMt9/Ds5XNrMOw70cVqfEy+GjyLj7+7DyTv0WIGX2gvI99ibRnGE8002R
 oIy9zWlMNAOU6zlRmjeX905gg8iHv80e59E7Cpw/GnUtOf3u8sBbgP52nvR55NxCqT
 cTmXcIp0DVJSotlWCAqDLcUv7hll5a9KkLuzprMs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.218.231]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCbIx-1l0CwL2Qmh-009hBv; Wed, 10
 Feb 2021 12:22:42 +0100
Message-ID: <41cc52bd57a466f29ea81676d42f57a7b9da7dd8.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, lkml
 <linux-kernel@vger.kernel.org>
Date: Wed, 10 Feb 2021 12:22:41 +0100
In-Reply-To: <bfd62492-e6a9-3899-dd7d-87b7800f45c7@amd.com>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
 <2793c200beb530ed4a8ac32c5eea0f5aaa53c7e8.camel@gmx.de>
 <bfd62492-e6a9-3899-dd7d-87b7800f45c7@amd.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:68gmFSGFN0LnHujduM9XiX8QFw5u8N+Vf0SnN2VCeJb7Bx9apQW
 aOlFZDgNFI0fgd2zYTiqKEm+D5I/e/ZE2MBua9IeHuLOi1WGhApCkPdnINMXP8i3fQuGNPv
 JksQ3689oZYss2/+3g45o3GTm4CavvgULUdEH1H+Dsm+BBNiVfTO+9JsoodhoBkh7zkwAUh
 fN3dwISvvn+17fTcPWI0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c2lH6Z3nDvg=:wnPKdrcufMshXe4hLgZhVX
 qPzvrlrRPn1rSZEIRd/718+RZtITvdHormkxdrlIV9emEMjVckCJ7DEQiZLkeJHtgMZPWvay0
 a+2eZUp2JHs/5x5lwEagWE7MOslpRficsdu+/fqeUKGb3z21QdVGbGpP3gUP/gs+rrmlmvYCm
 3v3tBKXdq+Jo2lgNlnKTd4eJIoYjBWUZ+taqQ2Re9ygBd6twiVTxfDTdH913kz/GkC+sK+D9I
 g2cj0k//X/CB5jbxuVDdDg9xPairiESUfB/rgAardZGcDrWK3NwErxUpb6FfH8ibKjTzzn8+h
 hwauuXkn/DfLdy/59RW29EG/beTpUfe/Wv6jDL1dXKgC8c0takaimV5/lqTu0aFHti9DbKZlS
 woc7hG7C32B9FXAYKFbY+caQlfRY6SnqF/0huUyeQCaOmsOfnvHT3Y8e83VKXvW+f8bkH+3SK
 s+hi8EewDvqCEm/5FgYfvya+BsRDd7pOSDPhaDwC2CDwgOCsnJlDsZCEaLcpgUqS7zBOEwnsB
 utTkrN1zPaVkdwIViDzyLFZS6YCHJj2qf8+LvVp4hAl+mvgxNfsoprtZj1GE2wcFA4uX7Y4KG
 OsDzz4rTtt25lZt85MWv9YWK1E4urO4PwZfqCu04lEFMkZKG9dsJ1GItXjrpy1PkzDIlG/4Oi
 AKIHvCEDu02ZspRAhZuDUoRVPN9+PICgBrbFy08DxMch9a2H35IHeynkhdmliysupuXSK8y7s
 hI2XyT/dbI5K95/GbU8CoTZEF/WkAG6NATLn/RyxpbEX+jDGWtnxf+zCgWY+j3RLg+vdNZN61
 ieoTsubW3jCZRR3j3pa0JPisD1eaCpeOLCOIZFwc9CTBFtu7eTjNkrVVPu98z0nCE8EacqskR
 VaNps2YkJT4vp9eukY0Q==
Subject: Re: [Nouveau] drm/nouneau: 5.11 cycle regression bisected to
 461619f5c324 "drm/nouveau: switch to new allocator"
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2021-02-10 at 11:52 +0100, Christian K=F6nig wrote:
>
>
> You could try to replace the "for (order =3D min(MAX_ORDER - 1UL,
> __fls(num_pages)); num_pages;" in ttm_pool_alloc() with "for (order =3D 0;
> num_pages;" to get the old behavior.

That's a nogo too.

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
