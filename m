Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41A316A57
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 16:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89AB6E08A;
	Wed, 10 Feb 2021 15:37:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936C06E08A
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612971451;
 bh=Hllj1DRNwjrXF8TexXE/667+oel02VEv40oXa17WoMk=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=X/GFyAc8KOZacpnYN/SErXN2vQes3suqXLrPYczfWN1axw77x5h45pXJO+Bowa2X/
 plD3NKhYUxzZIilPlnG4bb6EjDKVLjvQZATXZNQ+aOpmqyfK/WRR4EVxk8xMraulsT
 ky1a4DQV/Wxo5r+SC0AQUnpxJRdTt4L0RVR3o+QE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.218.231]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWzfv-1lOrBq0Gwj-00XJj6; Wed, 10
 Feb 2021 16:37:31 +0100
Message-ID: <8a321728c08d548c5bb1b2c4f79e937e1575376b.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, lkml
 <linux-kernel@vger.kernel.org>
Date: Wed, 10 Feb 2021 16:37:30 +0100
In-Reply-To: <b72ee235-2a79-bf88-a220-6e34d30a4bbe@amd.com>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
 <2793c200beb530ed4a8ac32c5eea0f5aaa53c7e8.camel@gmx.de>
 <bfd62492-e6a9-3899-dd7d-87b7800f45c7@amd.com>
 <41cc52bd57a466f29ea81676d42f57a7b9da7dd8.camel@gmx.de>
 <5df26bda-9ff8-168f-e5a3-0bb503ffcca9@amd.com>
 <eeea2d002142ec7f8737b9d0fb5128b0cdb2ae58.camel@gmx.de>
 <468ec16b-d716-5bd4-db2b-fb79e6c72a4f@amd.com>
 <6b2fa70c333d49dee64fa3c96cd7b7c99e8a6e9b.camel@gmx.de>
 <b72ee235-2a79-bf88-a220-6e34d30a4bbe@amd.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:tbjD5h4wV7EjHFbCG94/RpyvAGkt05mKTTlJGV5/EorX1khwymM
 XcoIw7XCaLoCP+g8Jd/vfCVsT/WMyIW5k91YTHVQjG+IQGo9Y5u2DOkoYMLuY70nfPjhgyR
 tAj2d/Ero3mUIL2zqbTZQvtYGOq2GDW+mWTBD455B7yH8+zFgdD7nKbpm711j6ujIcMjLjL
 bVumuslfkZmJNQVI798cQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q0HxthXMSIk=:zhyKYY3jKykY/H5tlUZzJO
 SAJ8z+G67DIYmk5GorUWX7ceIHeUUGKZ0b1BvcsYKsPc/okiMzS1OXkc2JTc/nBxkwIZJ/EXp
 EeMJPchpvXAC7F6Y2o36+tguZ+fOWrM5bNGdj9UjrxyzRi6V2XONtvOwp5rNc6jD8R2pHjdAX
 i/CU4z8NboL63KKvQIfwO+sjD4fo4G0xIeaV2kkUGWP8u5RjjSqFl2oLUGn28JIBVYI8oEOR6
 dphINeFOMMW2GxgtFi8mOBRQfCxQh/PNiqz1+bSsry6qh8jKEAzTjtxV9citDw7bjQGObOOm0
 /xuz1IMDp/79lb80WkjbQ7gFx6k7C205h/HumnX+TuIZ6WD53QVEpxDM6nvoT19fKn/70QO/A
 lNT/DzMXQEPrQ/CNBXSD3qMDqjefC9h+7doom2U/GJX/EnSU9nOJAZDTD1ad+qguyQQzuaXg1
 8XZ/6d0EJC/CXDKylexJb7bci58L6QxqdZa9jfOq2mBQMjDqn/DYvHt/Ki4cahIYuKiF2El3r
 aNvGDAIuWhz6tUUi4ri7PhMq8RarjJ1YKFpPx/gsSoMthQ3vdmEXbFxf7kveWaFYSit4tqVg0
 0PvHzg5aRGWfvcUiOxGmP93rqmUSjB0JeuvSvbqb6MmfV8rZXA21WyzQ0Ibe0QWFY/FI1m9mV
 KS+qcyf7Rwrvw4LX6TrLKY2W6Ewkkx7WGjkiwpyBQt73f4HQf0Ie0Lg8JLvhk8OzjdPC3nguH
 rXqi7Cqh5+aactWJeKBN+jyvC6GLehuhpl0HuAmhg47ByeZukquizNuNxET4RvXfG7dsCXUOR
 hKxJCNRPuoScD0CeB5PHTufDNEtPkD0C6RgON840RTNTbevMht9uLT3KHbP4REZ2AFUY326QF
 q5Lj0h1WnJqDGR9pp/Ug==
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

On Wed, 2021-02-10 at 16:34 +0100, Christian K=F6nig wrote:
> Any objections that I add a Reported-and-tested-by: Mike Galbraith
> <efault@gmx.de> ?

Fine by me.

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
