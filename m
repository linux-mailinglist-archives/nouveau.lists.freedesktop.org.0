Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7942DD99A
	for <lists+nouveau@lfdr.de>; Thu, 17 Dec 2020 21:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9D089919;
	Thu, 17 Dec 2020 20:04:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E677689919
 for <nouveau@lists.freedesktop.org>; Thu, 17 Dec 2020 20:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1608235469;
 bh=FWVVbi64fhOi+6PYs3/UZsujVfskYBj31w+7wUkgL6Y=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=gDeASji/CRBScdefY3a0rDH1vf8N/M+PN6UVXnN+OXQuR0QBkgK/DfyRdSzvV+Wiz
 Euca77Kojnv+kCFykOXD1YfUYU0tFK2Uss5nM5eb6FJYG/wCS8jqOY8X+TJTl2aqag
 6Q1Gp9ROwT9esxw01IXGNH6N8MkTf1XoTP54L+NY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.217.61]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowGa-1kJLrX06Va-00qRb4; Thu, 17
 Dec 2020 21:04:29 +0100
Message-ID: <4b18e97788fdfcc59c69b0836b693e737a48c5d9.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: David Airlie <airlied@redhat.com>
Date: Thu, 17 Dec 2020 21:04:28 +0100
In-Reply-To: <CAMwc25rTv0=LuAUoHqC9+Eh6rdaywwrigMza6yKbwbRiEwLZGg@mail.gmail.com>
References: <fe612bbbeedd0ee0d03d04c7341ea62406b957c7.camel@gmx.de>
 <136aa09d13fab723e0460b73608ed3950699f2b6.camel@gmx.de>
 <CAMwc25rTv0=LuAUoHqC9+Eh6rdaywwrigMza6yKbwbRiEwLZGg@mail.gmail.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:nvNRRXcRWLcJnQW+LzAEELym4xWiqFu0SMrdg2Dp6VHlyGDz7gD
 2sXtQA2VcbxZvRFYnsFP3lZWuhZJG6Iss3VCME8pByuEJfvLI7d0Twmf7eHLPhCMhKPDeeR
 FXuOY4R0jgtu9jkMc+OXDaQZpVDoYclsjUtf20bOlyeC6Jt2cDIM/xkrpIxXrbNQAOhkXqe
 slddb/Xg4HC2Lub+xOcyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f3diTxjBeqA=:G31ad69iCsf717rBLzPT/x
 T3id+2SsBxLwJ7czjiOq+DIIHdoolUroRxJPbrigl/FPNcatQ0lAW0kSlqxRl2UB+FQmsHZhz
 8kUOAbo42+YgI+LSENk1kvhU80cF/IsBfHGBMWKvnIgnJQ2GC9csm0Ctlv6kN9MSkui920YP4
 0r5mLv2+74eta0uo4Gqp2c5mAWMCa+1LVoB/eL6MtjtM4VQ4WRnjX/9eKfDAPRvosN97vT6sG
 QHkLZQmIYPRp2Yz30Z/IateyLW6zGoYlqBX4tlAmyjpHvGAmZR3RO9R8GTlMLWFwbXLuIvD48
 3ntQS2ETVcoSz0NyxjBx2/FlBd+8LG4Tx8Hb2MivdKHxM5o0niBqare5HQmkiRUbX0pVKX2bw
 FUcXlRLfattlWCAbKzdppZFkkMLLtHKrYlSna095QY2MJmxiyQwsHxU2MDuWDbzy23hoki053
 H/P+leVlH+krqxUFi+9wSPzwtuGRD83S97VofeZFkMtKtvr+zqI8lOqNgjABiXo2Xz0OEtHcY
 kI2haQi82WISHcz5qWOyhaTqYJSiSUEYCxlmaBKy2u9o/2giLBPz8w3IjK8NGS6PuGXKcAEi/
 UEdVoy77vvMxwRCLBgtCmnfuk2Qg2JgtX8Ahl1W2dnZ2hCtr6jTsIFNg2JR2DTwTLqQNDHeJP
 zRjsuMeTpz4aZ3JYvHjT6/gwvGKZsFpOq0LIhsp4m/ynjPI1By8SewYBx3kz+qgcxauoieISS
 nbmxsaAXp1x5ELyoUoTt6c2x5Txd3VTqjC77GF1niM/+w3AKNoVY2q62rI2fROGOvRVJUmlC7
 GuSEhp53jwZrfje0a19prKcWSStnrul6a39sf7rGu3XtoxbJY0xrutf4gFuRI00oQz8OaWYrx
 ZkZqurKIqno5lkUsgFKg==
Subject: Re: [Nouveau] [bisected] Re: regression: nouveau fifo: fault 01 ==>
 channel 1: killed ==> dead desktop
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 2020-12-18 at 05:45 +1000, David Airlie wrote:

> Does the attached patch help?

Yup, that seems to have done the trick.  Fast bug squashing by the drm
guys today, two slowly bisected, two quickly squashed.

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
