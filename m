Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F60151089
	for <lists+nouveau@lfdr.de>; Mon,  3 Feb 2020 20:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EADF6E445;
	Mon,  3 Feb 2020 19:51:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from elasmtp-galgo.atl.sa.earthlink.net
 (elasmtp-galgo.atl.sa.earthlink.net [209.86.89.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB066E445
 for <nouveau@lists.freedesktop.org>; Mon,  3 Feb 2020 19:51:29 +0000 (UTC)
Received: from [24.144.102.41] (helo=[192.168.0.11])
 by elasmtp-galgo.atl.sa.earthlink.net with esmtpa (Exim 4)
 (envelope-from <mrmazda@earthlink.net>)
 id 1iyhkm-000GQE-6R; Mon, 03 Feb 2020 14:51:28 -0500
To: nouveau@lists.freedesktop.org
References: <PR1PR07MB5866B97AB18B70DCAAF5323F976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>
 <PR1PR07MB5866535FDEDFA0AE91CEF044976F0@PR1PR07MB5866.eurprd07.prod.outlook.com>
 <PR1PR07MB58665667D594FC9BE31E07A097000@PR1PR07MB5866.eurprd07.prod.outlook.com>
From: Felix Miata <mrmazda@earthlink.net>
Organization: less than infinite
Message-ID: <9b733f3f-b670-adc2-cfbb-b66660e840e7@earthlink.net>
Date: Mon, 3 Feb 2020 14:51:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 SeaMonkey/2.49.5
MIME-Version: 1.0
In-Reply-To: <PR1PR07MB58665667D594FC9BE31E07A097000@PR1PR07MB5866.eurprd07.prod.outlook.com>
X-ELNK-Trace: 7235c9a3853724b974bf435c0eb9d4786b5145e7d43802ebe4089ec2f12be1e4b21d4b616965a61c350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 24.144.102.41
Subject: Re: [Nouveau] GP107
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

outlook user composed on 2020-02-03 17:56 (UTC):

> I use GP107 on GTX1050 Max-Q Laptop and Nouveau doesn't work at all, only black screen. But nVidia and nomodeset works well

Which "Nouveau" doesn't work at all? There is a nouveau kernel driver, and a
nouveau DDX (for Xorg and Wayland). The latter depends on the former, which is
blocked by nomodeset. For Xorg and Wayland, there is also the newer technology,
non-reverse-engineered modesetting DDX that can be used instead of the nouveau
DDX. It also depends on the nouveau kernel driver when the GPU is NVidia.

Black screen is sometimes caused by Plymouth, which can usually be at least
blocked (plymouth.enable=0, noplymouth or plymouth=0 on kernel cmdline), if not
entirely purged from the installation.
-- 
Evolution as taught in public schools is religion, not science.

 Team OS/2 ** Reg. Linux User #211409 ** a11y rocks!

Felix Miata  ***  http://fm.no-ip.com/
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
