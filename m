Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC57680F9
	for <lists+nouveau@lfdr.de>; Sat, 29 Jul 2023 20:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD7C10E0DD;
	Sat, 29 Jul 2023 18:30:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 2146 seconds by postgrey-1.36 at gabe;
 Sat, 29 Jul 2023 18:29:57 UTC
Received: from lilac.mail.einfra.hu (lilac.mail.einfra.hu
 [IPv6:2001:738:0:415::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676CD10E0DD
 for <nouveau@lists.freedesktop.org>; Sat, 29 Jul 2023 18:29:57 +0000 (UTC)
Received: from [2a02:ab88:38c:6f80:f5b8:26e1:5c0a:8113] (helo=fin)
 by lilac.mail.einfra.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <wferi@niif.hu>)
 id 1qPo8m-0004iM-NR; Sat, 29 Jul 2023 19:54:08 +0200
Received: from wferi by fin with local (Exim 4.94.2)
 (envelope-from <wferi@niif.hu>)
 id 1qPo8m-00069J-2f; Sat, 29 Jul 2023 19:54:08 +0200
From: =?utf-8?Q?Ferenc_W=C3=A1gner?= <wferi@niif.hu>
To: Karol Herbst <kherbst@redhat.com>
References: <875y8dlep1.fsf@fin.soreny> <87o7l7i1t9.fsf@fin.soreny>
 <CACO55tua9PqFTVjU4yhN6DVvrMwSSuZOQ3nicaXDVS0uoDX_+Q@mail.gmail.com>
Date: Sat, 29 Jul 2023 19:54:07 +0200
In-Reply-To: <CACO55tua9PqFTVjU4yhN6DVvrMwSSuZOQ3nicaXDVS0uoDX_+Q@mail.gmail.com>
 (Karol Herbst's message of "Mon, 26 Jun 2023 11:39:14 +0200")
Message-ID: <87ila2wqm8.fsf@fin.soreny>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] Powering down laptop GPU TU117GLM
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Karol Herbst <kherbst@redhat.com> writes:

> On Fri, Jun 23, 2023 at 12:12=E2=80=AFAM Ferenc W=C3=A1gner <wferi@niif.h=
u> wrote:
>
>> Ferenc W=C3=A1gner <wferi@niif.hu> writes:
>>
>>> Sorry if I'm reaching the wrong forum, please advise if so.  My question
>>> is not about the main focus of this community, but I had no better idea
>>> about where to look for the relevant expertise.
>>>
>>> So: this Dell Precision 5560 laptop is built with a "T1200 Laptop GPU",
>>> and I suspect it draws power even though I don't ever use it, heating
>>> the computer and shortening battery life.  Is there a way to shut it
>>> down for good?  (Or to make sure it isn't causing my problems?)
>>
>> Looks like I chose the wrong forum after all.  Shall I try the linux-pm
>> list instead, or can you recommend a more approriate one for the above
>> question?
>
> The GPU should be getting powered down automatically as long as
> nouveau is loaded and nothing actively uses the GPU.

Thanks for the tip, Karol!  Letting the nouveau module load doubled my
estimated battery time.  Online PC10 residency is still low, but that
must be a different issue.
--=20
Thanks again,
Feri.
