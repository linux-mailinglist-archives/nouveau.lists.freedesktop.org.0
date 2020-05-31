Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8592F1E9637
	for <lists+nouveau@lfdr.de>; Sun, 31 May 2020 10:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FAA89EA9;
	Sun, 31 May 2020 08:08:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Sun, 31 May 2020 08:08:54 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FEE89EA9
 for <nouveau@lists.freedesktop.org>; Sun, 31 May 2020 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590912533;
 bh=q/tORPlp0EWYnt9tH2UDu/psahHRfi5vrlOUO7gRk6A=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=o8ILRHuEn1QtfUtbg0jvtwotasUDeMilMkjWT4W+NbAMDT4A8S1v3+cKYVIVmnBq9
 Ew1jriuGOFql4xCZbHqig6bs8ViYOntg3Ud7/bt1NcEJ1+LA18JN6RpLJ179oOyjwQ
 /bu+yGzw23aaqM1o8KEifFcLETRImALkhjVwc6g4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.19.10]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MEEeC-1jltac1Wum-00FUaX; Sun, 31
 May 2020 10:03:22 +0200
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
Date: Sun, 31 May 2020 10:03:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:MNpT3jpEJ7iDEs22X5lh4tM5OD6V+jbje/KJ0Az3/6eS/4fsxvM
 IRHXN0vVlVmychsnkc3b7CWsN1UEopW8QPW+Ko2KCdTz/if7eLBLiu08FiSKuHVpZquCI0e
 3e6ZNQTnzxt9CUdA46i1b7AOXhON6TLVskEmk12jWS+fnRoddyHWfAAmg9/I6nIXm2/QYqc
 YMhizRSW6Hn973BPyk8JA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fltNbU3GYqY=:rgK/mJNgJAUm73/35Tw0Mv
 L6qn6Ew1mqNniZglY2NNEQBuu55FGRBGw20YThkZYJISYa/RHrxmxLvXR01nIQwCpE7LbTYUE
 Uoq7dSncXzWCB1PNFgGnNUPpzzSFrJ6jJSAA5SSQ8m4NbA75S4NbrTnh/x/erEVO09AXZ+0qF
 JXS2r1o34PfmCiyAgWiSD/xoutHhzY900TwH7hBGNf/K7vE/96DkeQ37/T6WgwlsvHOkoi1P4
 K4OUBdaSNwXzu7PCUcBeGsnHDc5ln20R6NIdTq2OiRRl1tAxEPBn26Ls/TKqjpnZf3J/zhQSk
 uCWEg2u1eXKqHiwzeeuQoFYZapyn4ZIHHaLbjQVtHz1dO/iJp5SKVrXiEbXyRZYLGR2zwRRwC
 7Urj4trzlOxYJwhH2xkdP5qe7Y1m4+BOvTAmQ6u7ADMZOQHGjE7Gvc6eGH4dQwpkj0iam5hjs
 nznjwl1zJRlDetYKkD4+5RZNpws7wfQTgO88xfMalZ8lPrn8tlY3466OW0Dy/pItYi/G5rJhS
 l0GyuEb7C4UIsTrUQpGZZDXD1iI0q+xoz69iWbLPWbkpxaqAF+nsszTUFoCdTWDCGyoIqInH0
 eHUA6N0wp70ZqFyW5UEXKXpSsF3alPHgUVUL4eH0EmSu8M/omKYFd52zEr0UarJ4LpGwzXdbn
 26GFaGjRiN9k1NpXMcmBQHLEjgZvQVsg8NN1R0r0X1jURvbKpkU7Ti4Wgj6CDIsk0MHUqDhvS
 9/2AKwWmy03DUJobrKaz9o1eB1LjfRczNq/vq1+PI2gGUCsHFJPTDBblVPsxQwsC3s7EV4YPY
 NGd3lD52Xna67xLunQsNB4c0IutZqg+zJ/8SZTfLEeOsJbNlc6VMbtBnqJNZk+T1+HDr3EOdE
 YIalesXFUPsliIua5iFsUeU4fVflC1V9VIthE3vIIus+D4p6lZx++JvbyWkycz8tYWpGhuogK
 R+7pqzXomgmjk9qAKML7KesE1/nyBU6U5CGxQkrh4FSu1BRl/pZVeHNNAYtK+zyQscxc3guEY
 7SLPSeHP+KwJSk+yaAqyrN3wR8jFjtkk0wYDwUF4CcwZn0L04ldhe1c50pJy6CfxUEbnYMnaJ
 sev8Sjh9+YV7p4Paw+SVXlyUfaga+sRenPXk1xpSCirHxOJINIOMiBoblYxamx5tpu4gX4oQ1
 jO9QHwfs73dLNQCtT7OBaGZsnR7rd5HdsHqDz3yhuaEdmxPy960hlifR3nQ0KbTeDL/jq9aYm
 yj+ODpZnAg4g1eb/F
Subject: Re: [Nouveau] [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in
 gm20b_clk_new()
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

PiBXaGVuIGdrMjBhX2Nsa19jdG9yKCkgcmV0dXJucyBhbiBlcnJvciBjb2RlLCBwb2ludGVyICJj
bGsiCj4gc2hvdWxkIGJlIHJlbGVhc2VkLgoKU3VjaCBhbiBpbmZvcm1hdGlvbiBpcyByZWFzb25h
YmxlLgoKCj4gSXQncyB0aGUgc2FtZSB3aGVuIGdtMjBiX2Nsa19uZXcoKSByZXR1cm5zIGZyb20g
ZWxzZXdoZXJlIGZvbGxvd2luZyB0aGlzIGNhbGwuCgpJIHN1Z2dlc3QgdG8gcmVjb25zaWRlciB0
aGUgaW50ZXJwcmV0YXRpb24gb2YgdGhlIHNvZnR3YXJlIHNpdHVhdGlvbiBvbmNlIG1vcmUuCkNh
biBpdCBiZSB0aGF0IHRoZSBhbGxvY2F0ZWQgY2xvY2sgb2JqZWN0IHNob3VsZCBiZSBrZXB0IHVz
YWJsZSBldmVuIGFmdGVyCmEgc3VjY2Vzc2Z1bCByZXR1cm4gZnJvbSB0aGlzIGZ1bmN0aW9uPwoK
CldvdWxkIHlvdSBsaWtlIHRvIGFkZCB0aGUgdGFnIOKAnEZpeGVz4oCdIHRvIHRoZSBjb21taXQg
bWVzc2FnZT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
