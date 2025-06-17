Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA6ADC00F
	for <lists+nouveau@lfdr.de>; Tue, 17 Jun 2025 06:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C00B10E4A1;
	Tue, 17 Jun 2025 04:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=free.fr header.i=@free.fr header.b="a5gFiMUa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3127510E4A1
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jun 2025 04:06:20 +0000 (UTC)
Received: from [192.168.0.32] (unknown [91.156.66.55])
 (Authenticated sender: martin.peres@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9BC5B19F57E;
 Tue, 17 Jun 2025 06:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1750133175;
 bh=0bMr1cxB32hub3DA4yhjGvEBmw8lLAup1xKSrR6156A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a5gFiMUaVuB/Qgr08FcNN4oZ0dvdJaCHUM+tuHvNdVj78O5R1+QvLokwXqYR1pR99
 VdVgarZmOe7djclwcdBytfLnkKu2j977/wcBdJWzV3iktqvfqn7UF4YkU8jh5/604j
 dZNIOcXpb1XhrmQtJYs39+uGjKV+gnpDdX6RLEaxivKOYHopwreoIY4snfK+JQtArO
 adzcstzOQvKzExHGuTHFSo0ns9Bberx6I0Jz2vqkCS9uDcadsorH8XUJev7aJdLnuW
 M0fGR5c7TkboIUr4LMx04Bq3BJA2599ehVi9HOUzVko1PkVj7lF4tcqlNjfTSjOCS6
 ZgAaSYREZb/Ow==
Message-ID: <d9be3980-3325-4759-b4bb-4e5832243ce7@free.fr>
Date: Tue, 17 Jun 2025 07:06:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Set DRM_NOUVEAU_GSP_DEFAULT to default y ?
To: M Henning <mhenning@darkrefraction.com>, nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Ben Skeggs <bskeggs@nvidia.com>
References: <CAAgWFh2wsJ3H0+Wa5=t7T7uJmnf8Zh49r==h3hbN650buSHEmQ@mail.gmail.com>
Content-Language: en-US
From: Martin Roukala <martin.peres@free.fr>
In-Reply-To: <CAAgWFh2wsJ3H0+Wa5=t7T7uJmnf8Zh49r==h3hbN650buSHEmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/16/25 21:41, M Henning wrote:
> I've been wondering if we want to switch the default value 
> of DRM_NOUVEAU_GSP_DEFAULT to y for the nouveau kernel module. My 
> impression is that at this point the GSP code path is both much better 
> tested and much faster than the classic firmware code paths on turing 
> and ampere. I think that encouraging distributions to use GSP by default 
> will go a long way to improving the default experience for users.
> 
> Thoughts? Is there any reason not to do this?

Yes please :)

When the GSP did not bring anything to users because the userspace was 
unable to really make use of it, I think it made sense to keep it disabled.

The situation has however changed quite drastically and at this point, 
not using the GSP has a big impact on usability. And users who do not 
wish to depend on a proprietary firmware can always use 
`nouveau.config=NvGspRm=0` to disable it (if they can't find a Kepler 
GPU that would be supported using only open source firmware).

I would however appreciate better error reporting when loading the GSP 
fails, as it can currently be quite unhelpful without increasing the
drm log verbosity:

	[    2.177205] nouveau 0000:01:00.0: gsp ctor failed: -2

Cheers,
Martin
