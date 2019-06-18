Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F44AB03
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2019 21:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689776E22B;
	Tue, 18 Jun 2019 19:28:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26B76E22B
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2019 19:28:33 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [92.201.122.123] ([92.201.122.123]) by web-mail.gmx.net
 (3c-app-gmx-bs22.server.lan [172.19.170.74]) (via HTTP); Tue, 18 Jun 2019
 21:28:30 +0200
MIME-Version: 1.0
Message-ID: <trinity-60f06d18-ea3c-49a9-8a25-d6aa7f233436-1560886110718@3c-app-gmx-bs22>
From: "Harald Harders" <harald.harders@gmx.de>
To: nouveau@lists.freedesktop.org
Date: Tue, 18 Jun 2019 21:28:30 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:KP7j2e30j73zzhnrmOXiUyP2C2vf6nzDgZS+J08sGHTWlkHLzcB59FF5RVpSf4Cyil5Dk
 dfq05kwYMD8WigYgwMMUZQE4VQbPrtDncAEztUP1LAFhVULOpHE6j+kRCZd74eOf3MqRH9+YpymH
 8rqKTBN2duqDMMNsUbiT8qNwT5GLMToIbNAjO0ro2gvNmvkRZcvMtBuA0a7vIIXQbxJy4j3sQWZN
 MdFgIxwDKGP1UFhM/ZMOsOdW3PyyydigA2gtzBzE9eZL+LSqu+UlaozA7K0XUv/6cw1pwMoWlgCN
 hw=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1QUGh8K9xv0=:mpaKzVPYWqxIrfKUGhKDS2
 Ifealc4AQ9arF5lABJLz4MXkzfRIsG7ArwopIKfCzwvIc6dr1ROqdj1eZLsfWkNIB/RwjhS3w
 hzuqrQq+cNAL/BMr4y9G9HOfpCPohE6qpjBnYsSkBW5eR7iAJtdNdzcoZM3S1LltQN/k3C4jW
 uYrkVnupzE/thx3AM3HjxR51ezkHTkdnSEQm9OlxNzlhEH/yvXzL9t/DgRiQQHBoCOe3gGdKy
 jxVnkxtB+uPQCr6P8F0BNZeLCMgvHI7O2MHe7/M+/JK/edArprQE7nkzMQpz0HHLaPJhe/kow
 TyccixhKP55yRY6nisZnjBxUmFplwPLPgxMtrkk9AMxA8dmF33eBhcYJ7XAT97evKWUuH9ACZ
 1ATfietqydv9RsU2AJYmQAy2zdwvWAGLKRdDmMxFsLiSBqJYk44CpfdPQwvkyGEPp93G6uqz/
 wTHNNTYKK/5YdVuML4kDhe6XOS+RDjlJKxFp3BcYWrzIXCZqrgeFd66VM7JgHHJ0Lbqadkl2S
 7LnzZUgza9kSxwSJfGCEiuJng76sfrM339lB5ZeH2p4D+lIh+qouym/QVk5zFVNUrOV0bemlW
 OuAumzFQSPpQ7xRa4dpeguJMkqHJtekcWSv7QKEcIFBRUi2B7Uq08NRg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1560886110;
 bh=UatIpL85/jFpAOuncuA0Ujy9dUbxz9kP51n60Sb/iC4=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=fom1hdLttSt8wdBQt0Y0gvzntM1cMw/yV0d5OdnpkXvlxIIGWJjSCSAfTiyDEQYAZ
 Cf8k9E5OJHpFjaUlbW3OVKT27u0i2ZYZ5mCs7IYaMmqskwwCULp/e0FtrqWY4DQDxE
 oDyZX3/u3LXTAu945czNHl/kyg37MB+5WevnWVls=
Subject: [Nouveau] Instable graphics with GeForce GT 730M,
 especially on external monitor
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0101000947=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0101000947==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Dear all,</div>

<div>&nbsp;</div>

<div class="signature">I have recently updated my Lenovo T440p with a dual graphics card (Intel Core + GeForce GT 730M) to OpenSUSE Leap 15.1. Since then, the external screen (connected either via VGA, DVI, HDMI, or DisplayPort) has a vertically stretched output which jumps horizontally in high frequency. Whenever touching any settings for the built in display (e.g. by gnome-control-center), also this screen starts incorrect display. Sometimes, however, also the external screen works as expected.</div>

<div class="signature">&nbsp;</div>

<div class="signature">Installed driver version is (only 2D installed):</div>

<div class="signature">xf86-video-nouveau: 1.0.15-lp151.4.1</div>

<div class="signature">libvdpau_nouveau: 18.3.2-lp151.22.4</div>

<div class="signature">libdrm_nouveau2: 2.4.97-lp151.1.1</div>

<div class="signature">&nbsp;</div>

<div class="signature">I have followed your instructions on the TroubleShooting page, No signs for NVIDIA drivers running, everything appears to be okay. Minimal xorg.conf did not work, screenshots are okay.Unfortunately, I failed in installing the most recent nouveau version (neither /lib/modules/4.12.14-lp151.28.4-default/source nor /lib/modules/4.12.14-lp151.28.4-default/build are present on my computer even though I have installed the Kernel sources). The installed version is still quite new, isn&#39;t it?</div>

<div class="signature">&nbsp;</div>

<div class="signature">I suspect that I might have the issue you describe under &quot;Blank monitor, flicker, snow, or other random live image corruption&quot;. I would like to make sure, however. And since you warn with regards to potential permanent damage, I would like to make sure, first.</div>

<div class="signature">Can you confirm that it should be this issue? Or are there any other things I should try first?</div>

<div class="signature">&nbsp;</div>

<div class="signature">Best regards</div>

<div class="signature">Harald</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div>&nbsp;
<div class="signature">
<div>lose:/home/harders/download/nouveau/drm # lspci &#124; grep -i vga<br/>
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)<br/>
02:00.0 VGA compatible controller: NVIDIA Corporation GK208M [GeForce GT 730M] (rev a1)</div>

<div>&nbsp;</div>
</div>
</div></div></body></html>

--===============0101000947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0101000947==--
