Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186A87DC9C4
	for <lists+nouveau@lfdr.de>; Tue, 31 Oct 2023 10:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0213010E10F;
	Tue, 31 Oct 2023 09:39:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1247 seconds by postgrey-1.36 at gabe;
 Tue, 31 Oct 2023 09:39:41 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7651510E10F
 for <nouveau@lists.freedesktop.org>; Tue, 31 Oct 2023 09:39:41 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1qxktf-0002kf-K2; Tue, 31 Oct 2023 10:18:51 +0100
Message-ID: <5ecf0eac-a089-4da9-b76e-b45272c98393@leemhuis.info>
Date: Tue, 31 Oct 2023 10:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: "Owen T. Heisler" <writer@owenh.net>, stable@vger.kernel.org
References: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1698745181;
 f839e281; 
X-HE-SMSGID: 1qxktf-0002kf-K2
Subject: Re: [Nouveau] [REGRESSION]: nouveau: Asynchronous wait on fence
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
Cc: Sasha Levin <sashal@kernel.org>, regressions@lists.linux.dev,
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

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
> 
> This started happening after the upgrade to Debian bullseye, and the
> problem remains with Debian bookworm.
> [...] 

Thanks for your report. With a bit of luck someone will look into this,
But I doubt it, as this report has some aspects why it might be ignored.
Mainly: (a) the report was about a stable/longterm kernel and (b)it's
afaics unclear if the problem even happens with the latest mainline
kernel. For details about these aspects, see:
https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/

You thus might want to check if the problem occurs with 6.6 -- and
ideally also check if reverting the culprit there fixes things for you.

That might help getting things rolling, but it's a pretty old
regression, which complicates things.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

