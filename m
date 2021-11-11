Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDE944D543
	for <lists+nouveau@lfdr.de>; Thu, 11 Nov 2021 11:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F327D6EAC4;
	Thu, 11 Nov 2021 10:48:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 10467 seconds by postgrey-1.36 at gabe;
 Thu, 11 Nov 2021 10:48:40 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9386EAC4
 for <nouveau@lists.freedesktop.org>; Thu, 11 Nov 2021 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636627718;
 bh=c43eITtWTzvIQ97GDO5aMWXIRLvXTvvIfaF+N6dd1Mg=;
 h=X-UI-Sender-Class:Date:Subject:To:References:Cc:From:In-Reply-To;
 b=XscXj4viY1/nJVUb1sSJSiLmRBbNQim/BKa4i5Zohx6IYmdQtbvW1Tebg6XcDGYnm
 SpKalwjFAJvcV5vtTzXhoX8uEX7gS9H8OF0UMsDVAaYZzg2ldvEkmbkyw9L6E4K1lP
 CULKQ/qm4+LhrIVgyiASz+Pwokmr4MVs0ZXHPIpE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.181] ([178.115.40.235]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6e4-1mDQVs0mK6-00heZg; Thu, 11
 Nov 2021 11:48:38 +0100
Message-ID: <838ab7cb-dcb9-a842-cb9c-4aeae7ddbc9e@gmx.net>
Date: Thu, 11 Nov 2021 11:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: nouveau@lists.freedesktop.org
References: <4a8b1573-3cd6-19cc-b18b-588d7d8283d9@gmx.net>
 <CACO55tun0ohXCNV_3o3eZozs7+ehy-Bv0_cxP+uaOMFgwkq_Nw@mail.gmail.com>
 <3301ae21-6427-b706-e544-67ec82109271@gmx.net>
 <a17361fb-975e-a845-b715-82cba2d8de11@gmail.com>
From: Linux User #330250 <linuxuser330250@gmx.net>
In-Reply-To: <a17361fb-975e-a845-b715-82cba2d8de11@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s/f0qp1gT+D64tzFh2VXb/4+qK4MZUgpilfBt+vHpKk54SWYw+S
 voZxIa/DuKi90wuCsast4+CvdMXEH9Rybcr/FqbKbiuDJEprYex/2y27sjAamCDPGgQFLE4
 9SUAf7SqBcZZJ14z5+fc+yWAG5bIP+6VRbzUFR4xWOB/tFx48AqtH8SLV5FX4tJq/HYS2MR
 9ds0tnedkpkmHv7Tdmlww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c6I2ZJxsP38=:tM6HvdjfAtof2ss2DEt9Hq
 MoNPeFw28orA3583RW3aRHwOzSLzL/JOgwu+ASmmsZFhQelKJD+JwooLyJh+stptUVNt63fqe
 OpULDI1gtbMIEmEk4Tjk9VEAMetL0uJqOGBqlytaBwFgj9X4ihPvDlBGZbm1mPEWjdubrt12S
 dQAmSK0DCOROgiEFQlKROXbnvLTCZdKHY5/63I4zt1fhYktU+ciL+3IlBMxBkiqSjOK+awv3O
 V96KQMur/kmoOz/UddqMq2Qm5954CIn+ErioUF1mnYD8jsZhPgzbDwSNBm5X1g2FxwKxR1Sw5
 fFkiSqWkewKlFvhay1MOSmpRz4WSiVF42vU+Ig7O0coVhn4xC17hvZxx75cCdWSOF6/amHC25
 cEWWq7SsBToG+PNoPXUTROU8BYcVVrO7GFFYeMlAOrt8Y8sSigaoIMuE0tmeYXZSIW8ZN6j/c
 FmTpJD8uZ4t0bF/5eYQgD1z5RsvVCP3VNUbTQM/Sd/y9IZc++unkjnzZzNeArEZp/aSaUySua
 XWJRS4EJ5J58HHSXJJiRzp5xIry5Rw+bsz2nLO4Ojtmk9lvEZzzu+CjmHGjKvClNsH0tgg9Sj
 wFndaRKowrxlGBq+SJg2grPapSOvvj2HrbR02jMhu00gPWjcSxs2BNueP1GjZqgU2yBR2OOsk
 i8bCvb/+EcDMxS5Bf5yVPg+rSmReWu4bt+Do2JpYZ1PQP2jpFi6L+5x0xwpPIUNUaNwVLK6By
 lU6WYDxAwAT2cOV6RfFmShzd4n70mEFjgAmA5cplpaF8mZcO/JiM2/dF3OlgMg0+ol2yl3qld
 DzakX5NpXwKcgiToPTQjwRw/r3jV0yndE7xDAY/VAQf4AP+jLjw6TQWMuQU6Ko+QUHukJp0+K
 Y4c0BfomnGlmbtSeIWq1RIyXoENqapl1dOvEiWIwqpDIKNQZOQYtzhNbZ1o/OrGEyIenaQ451
 Z0QLvBvVyIQqsDLV8xl/P0tCkhdBjgwVzJ398GKp/swGAeaHo+NEHZsAZ7s17yPTfIYWzC8Ob
 JsCghasbm9VLl/mMBpwZFA4dTuTSBWm2C2c1XL7mgDP53++tBygjD3kMpmRmTv31XDsk1QBBN
 xX9zHlc3526cfg=
Subject: Re: [Nouveau] hardware donation
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

On 11 Nov 2021, 09:08, Uwe Sauter wrote:
>> Hi!
>> Sorry for the late reply. I don't have the time at the moment, but I
>> will try the newest Debian testing on that system and report back. If
>> that does work, it is an option to actually keep the system and use it
>> as originally intended.
>>
>> If it doesn't work, I'm thinking about 1) Fedora and 2) Gentoo (because
>> that's what I normally use). Even though the later would be quite time
>> consuming, I'd certainly get the newest available sources to the hardwa=
re.
>
> Hi,
>
> if you don't have time to compile a whole new Gentoo system then take a =
look at Arch Linux where you
> will find the latest kernel release only a few days after there were rel=
eased.
>
> I was using Gentoo for many years but it became too time consuming and t=
he change to Arch was time
> well spent (in regards to how much time I need now to keep the systems u=
p to date).
>
> (This post's intention is not to start discussions regarding distributio=
ns, only to bring awareness
> to Arch as rolling update distribution using the newest kernel and drive=
rs.)
>
> Regards,
>
> 	Uwe
>

Thanks, I'll definitely consider it. I've wanted to try Arch for years
now, the Wiki is wonderful and I hear the distribution is as well. On my
current Linux boxes the updates don't take that much time really. Also,
what I do on one computer is more or less a template of how to proceed
on another, so it really isn't /that/ much work, except for the
compiling, but that's mostly the CPUs work... ;-)

Anyway, thanks for the suggestion! I almost forgot about Arch... /Shame
on me/

Linux User #330250
