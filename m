Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B998A17469D
	for <lists+nouveau@lfdr.de>; Sat, 29 Feb 2020 12:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0856E301;
	Sat, 29 Feb 2020 11:53:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from elasmtp-galgo.atl.sa.earthlink.net
 (elasmtp-galgo.atl.sa.earthlink.net [209.86.89.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24076E301
 for <nouveau@lists.freedesktop.org>; Sat, 29 Feb 2020 11:53:44 +0000 (UTC)
Received: from [24.144.102.41] (helo=[192.168.0.11])
 by elasmtp-galgo.atl.sa.earthlink.net with esmtpa (Exim 4)
 (envelope-from <mrmazda@earthlink.net>)
 id 1j80gh-000FpV-Ge; Sat, 29 Feb 2020 06:53:43 -0500
From: Felix Miata <mrmazda@earthlink.net>
To: nouveau@lists.freedesktop.org
References: <105a5043-8cc0-43cd-42bf-a79cafbd2320@earthlink.net>
 <CAKb7Uvg9RhCvRs+WU-0RdYc0SXMA-pXyppk5g7MF6b-MzPVUHg@mail.gmail.com>
 <8d8fc2fb-13f2-afb7-f542-d6f7983df059@earthlink.net>
Organization: less than infinite
Message-ID: <e3ee704c-9a2f-5e68-2e24-bb55c8ae8cb8@earthlink.net>
Date: Sat, 29 Feb 2020 06:53:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 SeaMonkey/2.49.5
MIME-Version: 1.0
In-Reply-To: <8d8fc2fb-13f2-afb7-f542-d6f7983df059@earthlink.net>
X-ELNK-Trace: 7235c9a3853724b974bf435c0eb9d478b2840978631958362e00fef0061640525977e524593a8d4a350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 24.144.102.41
Subject: Re: [Nouveau] where to report modesetting DDX bug?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Felix Miata composed on 2020-02-28 12:38 (UTC-0500):

>> Felix Miata wrote in https://lists.freedesktop.org/archives/nouveau/2020-February/035583.html:

> 	OS	Kernel		State	/boot/vmlinuz timestamp
>>> openSUSE 15.1/kernel 4.12.14    OK	2019-12-06
> Fedora 31/5.3.16 kernel		OK	2019-12-13
> openSUSE 15.2/5.3.16 kernel	OK	2019-12-31
> Tumbleweed/5.4.7 kernel		OK	2020-01-08
> Mageia 7/5.4.10 kernel		OK	2020-01-09
> Mageia 8/5.4.11 kernel		OK	2020-01-13
>>> Debian Buster/kernel 4.19.x     OK	2020-01-26
>>> Tumbleweed/kernel 5.4.14        bad	2020-02-02
> Fedora 31/5.4.20 kernel		OK	2020-02-17
> Fedora 30/5.4.21 kernel		OK	2020-02-19
>>> Fedora 31/5.5.5 kernel          bad	2020-02-19
>>> openSUSE 15.2/kernel 5.3.18     bad	2020-02-21

> Does this expanded timeline help any?

Apparently I put blame in the wrong place. I just tried a Display-Port to HDMI
adapter on a Radeon HD 3470 GPU and got the same failure.

https://gitlab.freedesktop.org/xorg/xserver/issues/992 reported.
-- 
Evolution as taught in public schools is religion, not science.

 Team OS/2 ** Reg. Linux User #211409 ** a11y rocks!

Felix Miata  ***  http://fm.no-ip.com/
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
