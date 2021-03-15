Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755533ADF5
	for <lists+nouveau@lfdr.de>; Mon, 15 Mar 2021 09:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F40F89CAF;
	Mon, 15 Mar 2021 08:53:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4721889CAF
 for <nouveau@lists.freedesktop.org>; Mon, 15 Mar 2021 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1615798423;
 bh=9LPM0fmN+fChJ623QJDgEpzb11FP7MLKIUhX7p5i7Yk=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=DMwMUDlY8dLN13Cox3u+QsZ3CT/6W1rux+Q2KS34DIal1kgS1gCFFd4DMU4mKUeA1
 5z/RRveK4qOfIreZjxkmzpJVx0RE+bgrDh4fqw84YLcaj9IrNlp2MdyvDHuM1Xs2Zj
 LCY+flbIhO9OjzbEk80kHPV5MxLG6VT96hOcgnJ4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.46]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDkw-1lfkrv2Q6C-00xZI9; Mon, 15
 Mar 2021 09:53:43 +0100
Message-ID: <d1d64307bf834d263bd57be84ca701eb2bc34ca2.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, LKML
 <linux-kernel@vger.kernel.org>
Date: Mon, 15 Mar 2021 09:53:42 +0100
In-Reply-To: <9947f244-762d-0937-f77b-9f650f3df4cf@amd.com>
References: <987bd1ca15545ca896c4e1c115e89a1bba0ad306.camel@gmx.de>
 <95c41bb3988882c202a2b7d6802f7528682e26b1.camel@gmx.de>
 <9947f244-762d-0937-f77b-9f650f3df4cf@amd.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:TL6c8Zmu/npCbiychLdOSpkiu2u7a0gVhPIWy0F3Ez5slzFz3Kt
 iOO4uZi31cI6Nwy0crbnLeqfDHj3zuFVfORD8wMQQNnsrEk2AWkcBlKZc+53IOpi8Wf0o+q
 ow+s4qcdYElAgiHKPGCNeaknX0/HQWDZcCo42h0rjuL+Es/T+KdRl/tVHl6yOQkoZBs2EZ8
 e2sFRK6XdDA4S6LdNCb5g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WrsebH+Cvxc=:Izfjx++GNYof6uHOUva9wA
 B8Isr+Jf/POs8vbRtRfSxZGl6JJDGgakeYtKSo6wPjcdDd634BHPvRuVkbdVUNlfzhswzGv/J
 +oP6IfD3izSyxk9KP8BScDBbdXkPafujLPGc4ADefFPSPWH8Sg0wF+/h/TAKunpv+Fqcinhme
 /ZTjywgbD4aoOS38s+yvsyX8V54/jyvufIRjpTHbX03j7xMQmoAYsfIEvTymx/Dq9/odTFgmZ
 JXQPnaUKqoe+xNYMgAQoLQCDjtTUzA5BlqfxVSAVIOWsJum6SDd+Reebn076oL2Ro+OJY2z9V
 STlCgZBDlhr0GHPpVdf4c7s+zAcYwYe+6lS02F9s5JmR8ZUQSlWMWyh6UY+BPIZ4cqnX038dR
 JzzVr2jF02rK4CygUVYPZVO8KspQ5ye/fVd11bsILchm6YlDPq4+fFUhcYV92UUpy+e2D0XSW
 c3IVmJe/lfm+IATY5zFwhycgfsReNgVIezKLZRCk+bcJm4XkLM8kS5/oujjPOcSKDh5ZQbttA
 oYIVwCHo5PODWUF0T13/SYTRvIjbOTqY2LorGzQBbcSP9tNyWODh+KpyzQT4W6yi1PLRZsd3q
 6M8igm8dNWty3NKBTqhtV2M2TB+PeQTCF2HgGGPM/jaHyEtRJRQ8B803T2qUxybABR+yTiC8U
 06Vk/W2GA2GHmtO8+xkBDTTWLonApenluamvtpazbTFEAcRR3NhZJYPEbYd3uChfaawVOqlNu
 9zxjgeivtu8lwcVRkWmiZOpW7upr2Jw4Mm4nEHNYtUwnjHyjQgq64Tzl2QHXM1IxH4QWHm7d7
 SvUVluOik248RaQdZNWEicalv5PPnofBuPpljz2uppXu2uHt06/gaN/xuLlTh3+N78HuDQLr6
 F89hHbsXGbHRfOk68buA==
Subject: Re: [Nouveau] [bisected] Re: nouveau: lockdep cli->mutex vs
 reservation_ww_class_mutex deadlock report
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 2021-03-15 at 09:05 +0100, Christian K=F6nig wrote:
> Hi Mike,
>
> I'm pretty sure your bisection is a bit off.

(huh?) Ah crap, yup, the spew from hell you plugged obliterated the
lockdep gripe I was grepping for as go/nogo, and off into lala land we
go.. twice.. whee :)  Oh well, the ordering gripe is clear enough
without a whodoneit.

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
