Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D90812B2DF
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B8D6E0C8;
	Fri, 27 Dec 2019 08:14:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1E36E12D;
 Mon,  7 Oct 2019 17:30:07 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13DA521655;
 Mon,  7 Oct 2019 17:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570469407;
 bh=7BgONx2fxTCBerkz+kZbipHG1ITh4B74FEdi9hVq484=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qWQvAQdNF/Y5LcuOkgQNFbrOYyT9zV8nGvQWGIalDCdrCIVR6/XSgL48CyNJqeOpW
 wkoJhtMz7y3IYD01mP1Wrjl9bN977MFW9mehzUiNsgxus43IHZn6NsBgmCM2nRA94W
 gP8kq+CEaHsP6v680i7rvL8uFTY1XraSbw5To80E=
Received: by mail-lj1-f175.google.com with SMTP id l21so14589437lje.4;
 Mon, 07 Oct 2019 10:30:06 -0700 (PDT)
X-Gm-Message-State: APjAAAW11g164FCpgSrdGTI+HI4XoTlnHXHjY1KWw5IsAjfibnhtJ2d6
 6pYUhf2bDy9ccVedqUF9dSDSj6pmniEbN96kP90=
X-Google-Smtp-Source: APXvYqwmBhQ/7r1sccn69bdteEM2oYrlVQ4Im2gzzv/FHBYneH2khccdbHlxPWXIpivEwoFLYEN1637fU1HLJrcElvg=
X-Received: by 2002:a2e:9159:: with SMTP id q25mr376354ljg.225.1570469405263; 
 Mon, 07 Oct 2019 10:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191004144549.3567-1-krzk@kernel.org> <87sgo4hjii.fsf@intel.com>
 <CADnq5_MqGehpWwOAxYg0T2x3qXisqmae2uGG5dijQX+Aa4NsoQ@mail.gmail.com>
In-Reply-To: <CADnq5_MqGehpWwOAxYg0T2x3qXisqmae2uGG5dijQX+Aa4NsoQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 7 Oct 2019 19:29:54 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeVFeSDpxPv-rDywCafWbN3mivtcM3UQX_+wZkyPcZwPQ@mail.gmail.com>
Message-ID: <CAJKOXPeVFeSDpxPv-rDywCafWbN3mivtcM3UQX_+wZkyPcZwPQ@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH TRIVIAL v2] gpu: Fix Kconfig indentation
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jiri Kosina <trivial@kernel.org>, lima@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-rockchip@lists.infradead.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 7 Oct 2019 at 18:09, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Oct 7, 2019 at 7:39 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > On Fri, 04 Oct 2019, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >  drivers/gpu/drm/i915/Kconfig             |  12 +-
> > >  drivers/gpu/drm/i915/Kconfig.debug       | 144 +++++++++++------------
> >
> > Please split these out to a separate patch. Can't speak for others, but
> > the patch looks like it'll be conflicts galore and a problem to manage
> > if merged in one big lump.
>
> Yes, it would be nice to have the amd patch separate as well.

I'll split the AMD and i915 although I am not sure if it is sense to
split such trivial patch per each driver.

Best regards,
Krzysztof
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
