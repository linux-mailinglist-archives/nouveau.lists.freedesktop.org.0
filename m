Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4A033B00E
	for <lists+nouveau@lfdr.de>; Mon, 15 Mar 2021 11:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A3289C1F;
	Mon, 15 Mar 2021 10:36:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5209B89C1F
 for <nouveau@lists.freedesktop.org>; Mon, 15 Mar 2021 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1615804591;
 bh=z//0Ux+UysFgyH7CDXJPD+i9uGU7G30CQ1l3zYtk0NQ=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=CWzOP+Fa6/zTQ0CvkOWGUiwg2NfrLjXbwPD3njUSIKtDCcwkrVXft3R8snrcmv2Ik
 MOFLICH2iaxIcaLsPvteu+0tQd+q8nP+1PGR6BJk318cGUk/fp+pn/TGAy5fiiKeHC
 J4qlAi5PcRcZYKW5dPCAkj5s0oiLEHGjFc8PQV7I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.46]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wys-1lP2NP0vsS-005Yab; Mon, 15
 Mar 2021 11:36:31 +0100
Message-ID: <d434abd7029f0b7978dfbc0c1f5db3979812fc35.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, LKML
 <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 15 Mar 2021 11:36:30 +0100
In-Reply-To: <d1d64307bf834d263bd57be84ca701eb2bc34ca2.camel@gmx.de>
References: <987bd1ca15545ca896c4e1c115e89a1bba0ad306.camel@gmx.de>
 <95c41bb3988882c202a2b7d6802f7528682e26b1.camel@gmx.de>
 <9947f244-762d-0937-f77b-9f650f3df4cf@amd.com>
 <d1d64307bf834d263bd57be84ca701eb2bc34ca2.camel@gmx.de>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:ebFQTdaHUCf/rltaX2Zlr/PjWmZySX140zI9UbR+9OFRKFI942c
 Hn/AasOXOpw3uvxAGFXtoOL82FdWW4oUjWwfgUBLDkcYAuzS19FbK5DanvTtB1EFysw5A6w
 mg6T65sunKHtVUDvEe6vdTKQQZPjW3/rpVv+wPEwg1kOOp+HenOf5KhjfuxhB2k7c5q1A78
 1dDLpkeR848hb1Ump1ghA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kxyd183p5cQ=:MsPvDmIHoCx6dRXOgX7baT
 wM2b7y+nLjLFlMVNC31lubMJNXp1W1VlaLB5tF2Ba46DpOFekm7r/eGchU867p6tZ53v0nwDH
 ZimWzWE7wnm5n6RO3eSLFH+X5u1hwDtmee2e7MGJ3yq8IdSoWQHaSDVsdd/Qnc1ZUKXt1/sYW
 O0Xcf1AGD3Fx8hirHUplsG/3xy9vXkXdoq78bGcOKeaDbNeOF+uq0DZG+DOQn6Y24TPkD8wl+
 LpDq/GhhcRNj/Jb66eFF7yOWNhUG0vqWR91+hhgEGfH4RQooZm7eQ54cvSzOE19dzRlgLrPz3
 YJebLi4FOJ22buWWGSpELvLlP1DilG+W+Wh+aZYZLJLKLetj0GBNWp9UjcJD+xw9jDd4eu3VK
 LV58nsYHm+xgP0ytWjqxjKmD5KNqvDUOa+tHkO3QqyWE0tfSI/47AqmDXKudypwqC4Pvk4nlq
 9DTQLnlTPAHLyow+DD7tWnBhiodSQ5ywHLy0g+yeuWPOSQDxi6cKssZvkvGX9itpBxW3624YJ
 9+/1nEsJFYUJXxUBRqhWwntBFhzJkOIU9I107gzj1FGjqmLQFtSsZJCzLXyDwoySEuJxgt4Fl
 eTvzVtPEf371TS5a14UYG3YD7w1HK/rRt9GZwyJ6hFUyY45ldZevXwA+iZxmTwHbSHMpGvNPN
 eXpQVNDk9NuwufhDBum/ZkN3ZoMZaM+yFz54ev5VJGT7R9gevB7lXWDEL81WHdPsIX5nzJw2W
 G/iCwfQpcXnzOhgE1wnIZp+racLZrfnYDPtOB9pQIPNcZfX4GsEPm+p3ak6WhRqiqvjmukzyS
 cHrA46tAbP8EQwismhQa6wPdIfn/X/qlfG3Vd+x3NGX6PjsUzceU3kxXsQFipJVFIbXylf6uE
 l/ofCc+ndHnF9aOQoOvw==
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

On Mon, 2021-03-15 at 09:53 +0100, Mike Galbraith wrote:
> On Mon, 2021-03-15 at 09:05 +0100, Christian K=F6nig wrote:
> > Hi Mike,
> >
> > I'm pretty sure your bisection is a bit off.
>
> (huh?) Ah crap, yup, the spew from hell you plugged obliterated the
> lockdep gripe I was grepping for as go/nogo, and off into lala land we
> go.. twice.. whee :)  Oh well, the ordering gripe is clear enough
> without a whodoneit.

However, after having rummaged around, two minutes with gitk was enough
for 551620f2 to flash neon red, and one build later confirm it.

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
