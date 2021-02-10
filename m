Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E9316682
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 13:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE3D6E057;
	Wed, 10 Feb 2021 12:22:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3256E057
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612959765;
 bh=+h8MD8271n/iybg6BuCV23jv8ZgoQb3mvg9bq6LK1Lk=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=i1Zic/gPsjIfBU5mzX4tjqqirDsdoAkJM+T93doBu+fXvTKHHxFMXdymBXVJ/qqDj
 HvnedSDGjbAeUk3gR+DoMaQ++SMb9bIBPJgQy2LozitAfnuHqKyB0gFrUtftnDi8Px
 45Pb/JM3E9a5yTH7KUsao1uatX+C/67vSlGb5jvI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.218.231]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiPv-1lLcNd3kBZ-00U0Ug; Wed, 10
 Feb 2021 13:22:44 +0100
Message-ID: <eeea2d002142ec7f8737b9d0fb5128b0cdb2ae58.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, lkml
 <linux-kernel@vger.kernel.org>
Date: Wed, 10 Feb 2021 13:22:44 +0100
In-Reply-To: <5df26bda-9ff8-168f-e5a3-0bb503ffcca9@amd.com>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
 <2793c200beb530ed4a8ac32c5eea0f5aaa53c7e8.camel@gmx.de>
 <bfd62492-e6a9-3899-dd7d-87b7800f45c7@amd.com>
 <41cc52bd57a466f29ea81676d42f57a7b9da7dd8.camel@gmx.de>
 <5df26bda-9ff8-168f-e5a3-0bb503ffcca9@amd.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:W4GPS80D+clxDsGdF2ikhyzexg0GvS2xkMk+USdFXQMRvvYcPII
 95dxzYyTD0cdg8+JCGbyuX+8S2IhEm6hIHqrJB7H1WhQMjPlVYYgLdGjm1ftAPEKxwBZSsf
 XhsmN2pfACcRuqQB6ZmY3QDsDJfOdI1qu1iX99mNPtFBEl2pgxGLIzfz6AklLITr8Q9g6iL
 9ZlUHvuBdh7ONQderi9jQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QaLTXDBf5aY=:d0+yTuFehnvZQRqe8bH9B4
 2f0ISzh4QRpFe53GFjmqHz5gW3xtHS9FcXEubTX6ZtfBRgi65+fjJXLzXbeLEDEwH3OT+fv+s
 kWUs3aureTrlmwLpEsB5hIEoaJtDEkO+sBvr4dWwbqG81xik0RM0Tz+Snar7uvf+/SRo/Ickd
 ASIlzt9SlnIML0B5U7zC67Kg1qGsvs5RnTbQS8ufHh6k3AjYksvxbggo8iCX1bhN/6DMPMtdI
 5LizOtEcq5URCLr2mvtFI+dFo/tdEju6RxmgW4qkv2zhBF/b5NF0ju+mHBPtBcn6DlaZoxJO0
 HXgnSSIthPfAmqFttIR/yVhJRL8hzClStxBfxYOr7hyYizPaOXjT6CRo5Vkh9bwHS8TMMkMrZ
 vasJmOy9V+WKv5IIR2ssZZRyo4IgI/j4GLSx71qxHHDGddjKf8ZO/ykPO+HILIiQ8vSKq/Fto
 bSpgNCRTs7eRvD49K3I2DwU7IqFvhorszj+c6TRwhpI/w26adGKjUG/S972wJQJ+ioKQxEcaV
 G9c2cONSyUYuYVXFCfudTceBVPPey+EiY5FEUi329M9Mzv17/1JQa60hPwkmyJOxsOEPnuvFl
 0tei7SNSBWAfvhp8/y9r1VR/E6BqjfmI1hhdS9TsZ0OX0h8VT/z4MA7mIKCPLhZM5lgh2VPg5
 JLGe77sfB29iJOswOPYcUuZUfCZVAQUSnvfovH1juX5WAqxjKVeQofz8MXxbK2xlek04476Fy
 VwXsU2UB800pTvWE5AbRDK2DdH0AIVhyA8teApKNVp7sa9ouUPMNtFG7106/FywAnasuoIOOG
 T7TrAH8EjsbVSytMLGYY3h1RG0fEfhzLPLw/gF7ZiE4W9JLOb8m/Uwles1gFzRoc0A4fwgdqD
 KykHIrAlK9ZN/WwsZutA==
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

On Wed, 2021-02-10 at 12:44 +0100, Christian K=F6nig wrote:
> Please try to add a "return NULL" at the beginning of ttm_pool_type_take(=
).
>
> That should effectively disable using the pool.

That did away with the yield looping, but it doesn't take long for the
display to freeze.  I ssh'd in from lappy, but there was nada in dmesg.

> Thanks for testing,

Happy to.

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
