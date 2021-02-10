Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F40D316498
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 12:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D62589911;
	Wed, 10 Feb 2021 11:07:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEB6898C8
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612955211;
 bh=mgx3ymtQ1de15m2eafNIPVv5s/CjjEQXbMYNmwH6d+A=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=Gu/Em9lbrGfcBQNm1I47zihxj5+FxT6E2MQUAND62VSr7oAApnRPFj+jJHT8bYRJL
 gVbJ5qOUkZlg09akW7byUv7vBZwSgGZdrXgOmOEq+ISurX5HmiVqSoAzKdM/YuWib5
 YnDXo3k85iQk2uhd3cmZqiX2cmrr2CRArpXVIyYw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.218.231]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnaoZ-1laqMQ2oSb-00jXE2; Wed, 10
 Feb 2021 12:06:51 +0100
Message-ID: <2d09eca022b9909f69e3d738208dd13f96f5148b.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, lkml
 <linux-kernel@vger.kernel.org>
Date: Wed, 10 Feb 2021 12:06:51 +0100
In-Reply-To: <3104ceee-72b9-bc40-a5f6-2c5a7920e443@amd.com>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
 <9d221e6160813fd188de26d3b56443129e9f8003.camel@gmx.de>
 <3104ceee-72b9-bc40-a5f6-2c5a7920e443@amd.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:e+i9Yv+gazBn9KC8hnSPUn30v2SHjYREatZ91dLzNKBYyfHMtsm
 N545jaYKhFg+X4St1P4NTEUGPgKP+AQXYt//80PXY/PxZMFpWQVfdw7t03WS78KLB4vyEGZ
 e7j9DnYs3+zt71FA0cZb1g/Fd2qvUJfkWjcH60umN1NpFm0CRc9TuYRy2y6c7mXs3h/Ye2u
 Ce4arSL20xDEI9MM0qagg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jDEV5mnxqhk=:vgqkoONp5x2cGRuMVsPA/g
 eaw1WWpXHKSCjxSYUgte4lVtKQUxZ4BnRDOh1+eum+UiCuxRPnf92oomqqsxF4xBAac9ZRvUo
 8148nOys8/CkuVvyFjMClTpBtH9/nvdeDuSzuf8j8gz2y8lBpMY42Mp3T+mMxZgB6HXHag0S3
 2rpyEWQN9rq5T4T6vUKljB5wX9N8yW0gaqasI33WjWpTJfa2Fs3fDx/EmNyZ/oQk8HJJtZ96A
 BpjJkaQiPphmiU7hGVe9XMJYwy0xaLuaWtmMaxSZ775/dJxR0UAFrDfsB6/gzRxVbYSw+QcI+
 /BTQUu86OE0x7/fyyl8+qU7p3l/zjOgS1DUwNifo01o/oT8DSHw6PuEcw1QfiXzGeuYjRON6D
 gq8pQ64lfIamL14/HrXvRqlAq9KWJQU1gvtwS4O/zpLAnAlAQFK6E5wNyy6K3RwLh6IVg/mU0
 uQB7uWK+SDhKxdqnGRKtSLTjZhvjFVdrL71+2Ufo77jWsTIqh7oGdGU+H6W4DdgRiCZXzYHfZ
 Foe0equlgcduE6+7cTM4v/Ol+Ey1zw91dpWwVMjxjl7EOVLX3zH6JYYa4M8sx/LSwYkj/q1FM
 ddKKUPaho3hNJfdlsfwstCmITYyILksEUWHJWLVoo9iAbh8KXaozHhz5F6G8ebRBkzDbrenDS
 aqYHipLgxYGi6vTeK7CaVUcCmksVY583dqjagliKjRQbj1Zra0g+11pt2O+bw/QitWjWNd4jV
 TGLAXaNrfdnaF6v/Fnurlw/7fBeTfvUjqoj2oVQopNhKc3WV/Zhz0BEjpa9dB9bJ8BQERHyfR
 kwt46srgAtUw8c0EdWLTS0OIlvJl4GOxL1pFiHcOH30IQJnLVEZmUG3e6xoh3vmfnA3b446Dr
 H+rYlhB1rqVj5+BXyGwA==
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

On Wed, 2021-02-10 at 11:42 +0100, Christian K=F6nig wrote:
>
> Am 10.02.21 um 11:40 schrieb Mike Galbraith:
> > On Wed, 2021-02-10 at 11:34 +0100, Christian K=F6nig wrote:
> >> Hi Mike,
> >>
> >> do you have more information than just system stuck in a loop?
> > No, strace shows no syscalls but sched_yield().
>
> Well you can try to comment out the call to register_shrinker() in
> ttm_pool.c, but apart from that I don't have much ideas.

Nogo.. off to suggestion #2 I go.

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
