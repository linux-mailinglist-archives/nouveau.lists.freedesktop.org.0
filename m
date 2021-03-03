Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895FF32B7DB
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 13:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AC589EB4;
	Wed,  3 Mar 2021 12:41:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1E89EB4
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 12:41:44 +0000 (UTC)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MRmsG-1lNayw0dFi-00TBTa; Wed, 03 Mar 2021 13:41:36 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id A51DB1E01E7;
 Wed,  3 Mar 2021 12:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qL3XYRDwOfLE; Wed,  3 Mar 2021 13:41:35 +0100 (CET)
Received: from pflmari.corp.cetitec.com (30-usr-pf-main.vpn.it.cetitec.com
 [10.8.5.30])
 by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 6C2701E01E6;
 Wed,  3 Mar 2021 13:41:35 +0100 (CET)
Received: by pflmari.corp.cetitec.com (Postfix, from local account)
Date: Wed, 3 Mar 2021 13:41:35 +0100
From: Alex Riesen <alexander.riesen@cetitec.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <YD+D/zhUwC4zaO8v@pflmari>
References: <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
 <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
X-Provags-ID: V03:K1:Qz0AreXjuEMb/zszIzCBLOBVyleRi7CPkCEn1XhrOXHYuOxbJNg
 UUDEtLq6et80+E1Ndaw0nX2DTEnZIbBbtueJwuVKNbl2lgT+mC8Ri305SdM1fREpRnGJ0Jd
 ab++f2mB6nJSENAsEeJTZdMvagLtXdiLWUSfu4psMig6O6LzANpFC29so2ChSQOYauaLtCC
 M+TcvrZOFALAxO0j61QaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YwvAThqmu4k=:8plK12yMBze7rWC7IrvRBS
 Gn4eEdNswatef+T3YYm40NbGX43e38RCc5wUESrAAm9Y3RGkfStPJE9EzCUvtGQNrJRRAIsTZ
 OX7pT6E5nXZmy2CojwwKRmDgh45YSS5HL+1zWyqM8Zlsi8RHSikVH4fSgGAT/lYFzZKBxy5gW
 PbCvagabzpIwvYsMtH0Zr2g1sJAq3EduumZG8eSW4enFcqYDACK/+Rq8PD30FkAaJNykogkdO
 OQpX2p209p46f03UWEIr1GMPiWpEZR6EcnDSy2lq25Q64QN2uED0PDgycsZtUW06Va2bvb1C3
 OLGn56PZgvvmp8xoInC/7dilPlSQdk9/qN0HNlutjC0WYwidkVeUOibCnkqBNuXRJPTdhtYrv
 hLdu8UuzaONils7zgN9JSNz5BCMxWK5E3XZzO3Am421z1ZXbVJKKP9MmJ1sDmGb6sEA5Y2mOx
 +445omhvUw==
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ilia Mirkin, Sat, Feb 27, 2021 22:26:57 +0100:
> Can you try Alex's patch to modetest and confirm that you see issues
> with modetest? If so, can you (and maybe Alex as well) try an older
> kernel (I'm on 5.6) and see if modetest behaves well there. [The patch
> in question was to expose 256x256 as the 'preferred' size, but support
> for the larger cursors has been around for a while.] Alex - if you
> have time, same question to you.

Sorry that it took so long. I retestet with the same kernel as Uwe did
(5.4.101) and my results are the same: modetest with 64 and 128 cursors looks
good, 256 broken. Didn't test with X this time (this being my main office
machine), but can do later if required.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
