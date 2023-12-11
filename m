Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446F80C2E9
	for <lists+nouveau@lfdr.de>; Mon, 11 Dec 2023 09:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C37C10E350;
	Mon, 11 Dec 2023 08:19:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B9010E350
 for <nouveau@lists.freedesktop.org>; Mon, 11 Dec 2023 08:19:24 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rCbVa-0003vM-TW; Mon, 11 Dec 2023 09:19:22 +0100
Message-ID: <e27cb00e-ee44-4c1a-b738-17c3b15fb99f@leemhuis.info>
Date: Mon, 11 Dec 2023 09:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION]: nouveau: Asynchronous wait on fence
Content-Language: en-US, de-DE
References: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1702282764;
 95228306; 
X-HE-SMSGID: 1rCbVa-0003vM-TW
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: nouveau@lists.freedesktop.org, regressions@lists.linux.dev
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 28.10.23 04:46, Owen T. Heisler wrote:
> #regzbot introduced: d386a4b54607cf6f76e23815c2c9a3abc1d66882
> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/180
> 
> ## Problem
> 
> 1. Connect external display to DVI port on dock and run X with both
>    displays in use.
> 2. Wait hours or days.
> 3. Suddenly the secondary Nvidia-connected display turns off and X stops
>    responding to keyboard/mouse input. In *some* cases it is possible to
>    switch to a virtual TTY with Ctrl+Alt+Fn and log in there. In any
>    case, shutdown/reboot after this happens is *usually* not successful
>    (forced power-off is required).
> [...]

It turned out to be a problem that also happens in mainline, so update
the tracking:

#regzbot introduced: 6eaa1f3c59a707332e921e32782ffcad49915c5e
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
