Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173FB316425
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 11:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829DE6EC44;
	Wed, 10 Feb 2021 10:46:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1973 seconds by postgrey-1.36 at gabe;
 Wed, 10 Feb 2021 10:46:13 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0005B6EC44
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612953967;
 bh=EqTF/IzJ5aBtYznj+Amlm5Eoid8+zvpUSrnir5sVj1k=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=CDvfnncOgwxH6WUJkccQiGI5/U4wa487EzVXLL99NEz5f16onunjdKv7hINeJNOQG
 NFOktcuetDdvSNt0CHcQYbXqXtNtMVh91+zP6KMisn1DLYnEa5IqejyWWFx+dyM/7n
 YkvBkJrYJPq9vKq0OdMa/6U1AUo65MAfBXM41dE0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.218.231]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bfw-1lyoWP2HS2-0183V2; Wed, 10
 Feb 2021 11:46:07 +0100
Message-ID: <2793c200beb530ed4a8ac32c5eea0f5aaa53c7e8.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, lkml
 <linux-kernel@vger.kernel.org>
Date: Wed, 10 Feb 2021 11:46:06 +0100
In-Reply-To: <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:TlnFB2qCR9sD5yLrO0YrLpiU7LAV2SWJqMOW94u5Zbq51X7TGM5
 4ljx3CZrWVsASZj+zaWZrJ36OBantMeREs493mwNwntisbHNKzQmL3hei8OIvHnPp+bef81
 IFprrTG23DKkVVc+UINbbXXIaR7jtV7Hfgj1mRHsBjyIX4s/1k7sVvO2wmyKereZNVVB9Ee
 Vh36khUriaWCKcIcY5IYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ZdsEagwagA=:bnQO0F7rHtkODJhhOkxCNL
 8a3QLax7WH2Hf8g+m/A+XgOirOCPc/XMZrpzHUGd/yps3LmRw5FYCssmYlNiSbkFsD0kk8FDE
 1F4tqRFGxEfB70aCKkiEGaIdQYm7GsjAnfYHYnzTDXxlH4T1HxpCF624tuHUqzY48w0O7P54k
 T9bSKytO7TMYGL+NSjeU8SPbKdkiZc67TVmAZ1P/4EyBoXYKODUmBEEvznZpmBhtg/r2AAaKS
 dDVc0M/Z6OmgrsWNltmhOL+OQ7c6I0q4kLXVdrDsfOGPyaQWTW3bSf9TdH83mkvQpKKjHuK+C
 2+Lyyn6uAPbMLVC2psy+BFNzL1iXHhFiBp2cvgyzcTq+BunSXM5z3b9nXB/c+hFqKjeo/vqd5
 YWaHD1Cw8x2n7QKqv4bKB4gbR9bcUkW14M+Cym4GH/AAy23jB1I0XlZ9Wlm0iUE8OD7gWyr1/
 B3OeLTc81GGzRo5+fDf+K8l0w7aU5imwngFaqR7GtKlWAawzESlO2/5gK2+i3cveM1LjPzTiv
 T88a11Q695iFiYafOO9Q0NCZDF8KBsa+4+WUWE6aogxgaBhcmJZaThAgSouFF6UEnPYv1sFIi
 at+QT7WCyjHCVOLqjIRVhY1OYREfGe/gHw7/U+xC73/zArA8Nv+btvedIVdkZxM3iNt/EbwN0
 9wed1s5EzU6K0jzfQ58cRLq57yr4ZPVsf2Cd6i+ZnpwvUnRzQrOb/BwehZKbDkE8MSwqFvPm8
 E2VJ+fonXkWOXCV6ACMiCsqqiZ7JRl0IZRPhIUzsJIJOGLvFLkMJYZjvsT5izfIvO71yEs8WZ
 SazNtCytbsGLytS5a8GogOVVjSrB1avSf3vnQh39bLeg2QWPHBSNrvVYmDppxnvB+7lboechY
 vcAUf8ItG6reC3HAWDlw==
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

On Wed, 2021-02-10 at 11:34 +0100, Christian K=F6nig wrote:
>
> What seems to happen here is that your system is low on resources and we
> just try to free up pages.

FWIW, box has oodles generic ram free right after boot.

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
