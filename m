Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA6932CA62
	for <lists+nouveau@lfdr.de>; Thu,  4 Mar 2021 03:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C3B6E3EC;
	Thu,  4 Mar 2021 02:21:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A54C6E3EC
 for <nouveau@lists.freedesktop.org>; Thu,  4 Mar 2021 02:21:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m22so40571641lfg.5
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 18:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LSSsMdcQpFxHaMW9H9FPG1FXpwnEAafTZIYBs3ck4P4=;
 b=LysQGRTiKO5DTWnrNgNPyRFfHItB5hoZ1B0POfR97Df3v/N50w5vB1IeMZ9raiUU3O
 qc/CIlA1KXNegWaoNKSU9C5+Se6/rDvyHrw4O5XTVyOrvYkL9RcS5NzjCXYswqOJNU0P
 /hh/vbu871lNtQF6QPpn/BjmlKRPHm7L1MNfvf9WmpjriTsumhaJMWav+W+NLLYK4RyU
 8cUNcH4iEe0N8kcpoe4uXsQJDVG1c1s9OjAMCvd+01vLFvsNaeJkbx4e3EpiCO4kdGGu
 EQUZiqQ0RY7Zg2leQ2nXqMbrifOgoCQ7223H0npsbGCcQQIE28F2dnUzby/Age6cEelB
 YdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LSSsMdcQpFxHaMW9H9FPG1FXpwnEAafTZIYBs3ck4P4=;
 b=iKoSXjasV7VKX9lSsjpEjRQMgNrFT49oOIeUQRygOJA7zBgJoguNH/VWXjlHDn7Hjq
 q/mu3MqI9oz+JGZyamCUpKsBs84NjnCQ/YWEQisrd2iR74q5IwIOKeyeNsGw35i82xqI
 w1KEzk9GNgJKz/QVeu7Ghxt0ZXhbUOFRg5+/SKxUv/aK7T5EnieRhg7RH1JZvlbx0PCo
 RbANFHYQ+ddHqsMQZAfiA9BIa6pMt0+QrMFnYvk4+IQ3Cm3vIhUvSqxGy70u6w8wfpuU
 eQzGxF8602A3+EqbebxADajzFudiP9ZgxxB/HDBw6S5r9Y0RpYg1m558iOe54nGGeT5b
 aIIg==
X-Gm-Message-State: AOAM530KJZEL5f58R0ZquzxSuhfzmTwBuCOhnKKJEZSSZUBcoSB5mtxl
 Ds3pH/S7o+QxTQwfLeQy0dLbBTcNWbraCmw48Qesfn/+pIQ=
X-Google-Smtp-Source: ABdhPJzNb/CYgHP7ZOobu2rueIMvtMCwWwjZLzMCGXo5pWBtZd2+DElXj9xpuD2RKuCjqzMM+jJ/Q5nvCXzMGULZ67M=
X-Received: by 2002:ac2:5c0a:: with SMTP id r10mr892313lfp.47.1614824458349;
 Wed, 03 Mar 2021 18:20:58 -0800 (PST)
MIME-Version: 1.0
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Wed, 3 Mar 2021 20:20:22 -0600
Message-ID: <CAPpdf59bkxEQ9+iozLOc0o51w2h1e1jJhSROH-91YAEry3k8cw@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>
Subject: [Nouveau] Request for information and/or assistance
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

Greetings

Running debian testing, 2 nvidia gpus (GP107 and GF110) and 5 monitors
(1 - 3840x2160 and 2 1920x1080 on the GP107 and 2 - 1920x1080 on the
GF110) using one screen (7680x3000).

I would still like to modify some things but can't find any docs on
how to do that and my attempts have only made things worse and I can
function, even though some things are right awkward, on the system.
What I've run into is that my graphics system either refuses to come
out of hibernation or decides to come back on but in a locked state. I
then log into this machine from another on the network and do a reboot
for a 'graceful' restart (rather than use the kill button - - - the
hard shut off).

This event, graphics shutdown, is happening in direct relationship to
how much I have happening on the desktops of which I have lots.

In searching it seems that nouveau support for the GP107 is not yet
complete - - - - or that's what it seems like.

Is there someone out there who has some idea what the problem is?
(There are quite a number of different individuals mentioning this
issue in one of the bug reports.)

I would be happen to revise the nouveau pages on xrandr updating the
information from 1.3 to 1.5 and possibly some of the other pages as
well. I have no programming skills but I do have reasonable writing
skills - - - - would rather trade than to continue taking that 1/2
hour it takes to set my system up after each reboot - - - - taking an
hour or even 1.5 hours a day doing this is a huge drain on my
resources and would rather change this.

Please advise!

Regards

Aj
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
