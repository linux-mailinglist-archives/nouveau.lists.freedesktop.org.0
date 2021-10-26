Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE6743BB46
	for <lists+nouveau@lfdr.de>; Tue, 26 Oct 2021 21:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3061889FD1;
	Tue, 26 Oct 2021 19:56:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3837989FD1
 for <nouveau@lists.freedesktop.org>; Tue, 26 Oct 2021 19:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635278164;
 bh=WXgVxvcfkc8KDBTf8y8uPkFAYrRhGBa4/w+VRnIHxa0=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=NiR0IxMoMlI07WLb0+prWSN577xDuXzNuWZ61y+KXmL6N73o1IVews9mmXF1sXpzL
 V0FFMVhptqqNAIEb06ze2Nq9kGXRjGaa7lTvmefvzHmZQ++jmqUSgDZEL/HcvOQVQh
 XU1/Rg5sR1UmwGlsWpyH+ngrEF9CZ/bPCXemmpkg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.45.71] ([194.96.83.17]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf07E-1n8ipK0aKo-00gbH0 for
 <nouveau@lists.freedesktop.org>; Tue, 26 Oct 2021 21:56:04 +0200
To: nouveau@lists.freedesktop.org
From: Linux User #330250 <linuxuser330250@gmx.net>
Message-ID: <4a8b1573-3cd6-19cc-b18b-588d7d8283d9@gmx.net>
Date: Tue, 26 Oct 2021 21:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C35mldLsAjEd88HKMHp9lRWTWhcPTanZu8DcwP2Nyly8E/LoahO
 RTNh6KS8esXHxdZr5p4A9iCcMzK9nTHeZ2hjP6Yh44OM2Lb0uh0UpRJohC9TaWK9rowiUNi
 RnWNSyn+J6GC7LgfM41wuqDEhGstMt0Y2x8scQRMauBLD7s4CWUFCOypD6ar+lO9rw5vPcZ
 X68zAJ8go7o6juE3dEmGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CKA5HVCkCE4=:onPC02AULWwy5qQl1hBccN
 q1RkYbDEtuPCj/Ho+xlUvjYaXmCltgqMk9b+7tcqkNkVtjsGgBSjzlHTvOCBl/R5NGShLrFPW
 /bKu5TlABH0BG0gySSDDK++v+OrACZypTWTEp39kzHIkIr0oDJAVyvfhRR9gJE9UOORDdsM9p
 aX6uAg1djaEpufKb68qzpMWZT+wonIhVXC8zCDCdqWZM6MbFoxb1LnVseJKHSlWq5jhGp0eSP
 dV59wfF+A8DhaU8zYs71zwfH7G0kmOW46O29gmwjCRqfmRt/lsERNzcoR8J7bcD6GTdkjrnvS
 /0IMCiDSXGVGNlYTsgrxpFcZoI35kJYUMtINRsLQrVwlsD6V1/5q30aMdH1AQBbxQaq19VGAw
 ISBZydqszQSzg+H/EvAHE4mrs8EYwaD9ZhXZ8+sW+9cL0cPOluOstHCnMUl0AWujDg1DsSXpZ
 y/qslS1mO+xzw/qxuid8BM0tqfmoiJgZ2eqS1fMk+1KZE4re3bP8brRX1Sui9o7k4nURwwvW+
 zESkNj9TJtflsKYcZc7C+6vkkw8VWXBSvnDeZ8+tc/im0QKEcGVtZrSk7itE5oEqYeAtqT8Nq
 rvT63c/2457Hw8Fd7X/tqm2zO7dxUStT4xB7AZpjxTuYxbCy5iGy+iCIWlg6hk3aeJaJrmfrM
 V3y3T8UcnX27ijUlwQIB9TU4c+IZSpPKNUv6AJyem8IicOeove6h6yE7RnfPYnJ0GHtEhToO5
 VOUPmaiJ7hkKJuakqjBBQH7eMXQsxROMFC/UkA+hTlSNRVQ/w6qO4gtGRtizYezcwO+Olev4t
 Vg4Ygpa+cbN3GUVykWM3PCi9ht9HDJMq/8lCccDE5bSF2ZSX6LzD6HZ7Cp7rD3dVXQSZP+eJ/
 MMc0tBspEt5gun13J5KZ/NdkFkfsYcQQJkLdHrHaqs/EO3/CXwfoES+eBhuJoNuh7cc2K4K4O
 aqjvGo4bcmNHJWbGFTKp37hWdtYkMx7nehIrbVycD3Mr9Q/tL/B+wpygeZPcYzDK8F3Urim9q
 FtdaOR41QNkKpSMZOqYyDfmO/0DLezS16mpeaKJNrRrswQ3MsVGEAYitOhNlpGeQoPzDlyR71
 Xg9ONPhawSoUxI=
Subject: [Nouveau] hardware donation
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello!

I have a ThinkPad T61 with an Nvidia Quadro G86M [NVS 140M] graphics
card. Recently the nvidia binary driver, version 340.x, has been removed
from most Linux distributions, forcing the use of nouveau.

In the past, when nouveau was unstable/unusable, people moved to the
binary driver. Since this in no longer an option, nouveau is now the
only option. And I'm totally okay with it, I would have prferred an open
source solution anyway... BUT.

BUT nouveau is unstable. I experience random freezes, like others too:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D995866

The only option was to use nomodeset and to have an unaccelerated
graphics output. But if you want to use the laptop as a desktop machine,
this is not much fun.

Long story short, the question I have:

According to https://nouveau.freedesktop.org/HardwareDonations.html such
a graphics card could be of use?

Thanks,
Linux User #330250
