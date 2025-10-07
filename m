Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85101BC0198
	for <lists+nouveau@lfdr.de>; Tue, 07 Oct 2025 05:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BE710E301;
	Tue,  7 Oct 2025 03:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NZtWDNhy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F2B10E301
 for <nouveau@lists.freedesktop.org>; Tue,  7 Oct 2025 03:32:09 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-862cbf9e0c0so529104185a.0
 for <nouveau@lists.freedesktop.org>; Mon, 06 Oct 2025 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759807928; x=1760412728; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zRzHTOaUOkmAyAaBLcy9ebM3WJuX4bDU8dGAYrN/H78=;
 b=NZtWDNhyWuW23Hqr46GQme5ifdbSX5ZnGdY9aIMR9WxPPxOWli8aj6er84AUL0SzwO
 +YiE/41LCv8gLcZCWoaF564CDuQHcK22o+40jzJ0JCM5CaO1Z+qjTwqGLyrnvBTRzWWt
 faV04/Hi9luZlpSjrPt/aABGPKmOLc58Zu6ccTjxZKX+qaRyXe2OMFEENI018Ld7Vpn5
 CALlslnCd7akk1uIobWk8To+hiy+s5ixqi2wIAPalNqSIcPftNyuPiFJ9ZfT7Dwo3RhV
 47LthBxV6bz3x1dcHRR8d5CY0Bef2F2zuEG7hieLNdluTULD0/iwMbiATSzNbyFZ5lIB
 4SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759807928; x=1760412728;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zRzHTOaUOkmAyAaBLcy9ebM3WJuX4bDU8dGAYrN/H78=;
 b=dGHe3aE/A3p9ArWD+mnIfhQ5ICriC3VdjMTUtUvAkkpFTHCnyZTjgsjv9YaVl/6PhK
 rT9J36kfUMnc5dpXzqAQRmvOyQzbTVzFQGtfVN9urBJs5FpU9rtzwQXkhTbcSjzkoqLJ
 CWu6oIKWQdeXcJuaFUkaNgHOKkNQg5DQtmD9DKXHcfyYmEwniTXehhN4YtNKGUrLhD6q
 fOomO2MpmN0fC4Ha/FzAnQj1cjEhmtKVb9QKV3JSPIJGMFu5xIOc0jeQ02vT1/1EtPSL
 NouK33iBBQeQSm/ughjtPJCdWLlRB96pA4+SHM+92wrUM3DnxiY02lO+hpEUAawnR5vU
 /xgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCgIslR0IfU2z8rjSrbVcZqK5ZuphX7PYHYmX6EzGFGwN+J23M1EoRW7koEKsMAxzYg+CXKnDn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/+oAZc4VH1TM7iHdPPOj/ZC3oZVxEbz1coc8ekPpO5zCu1pNr
 u5H+W/A56AhGG+oDJP3Cy6wBA7kIjmlLXI+sc4BfoAaqBMHGTv6PSkHjjhZZ7SvBsqXiWpMNmsE
 0B84orlNsdKXiTdqPCWxR9PZ86PY1ptM=
X-Gm-Gg: ASbGncuFI7DsqDg+W6tJzopilA5yCq0WyoYLGlUC/74Slgzn17z/2MwScTU2+xvFbxz
 Q8RpsCZSsFLzEQjtWdLz/6F5a3eXeTX+o2KapG5G2ZbRA5tgL1LbZHWZDScQorhRJi/OuWtarGQ
 cRc/BHwHk8p2P9dEEJk1u4bXNqei3Zllk51u5PxB/jDqULsJyIyGEojnZm0SNBBDf3rKd2l1XzL
 1S4plAAoWZGXthidgEiBWesWJCygw==
X-Google-Smtp-Source: AGHT+IEpV14RL2FDsGLZyWsYzLwk0c6mVnvsVP8x5nUj7rkZ84ybVA4iHya2NADISw8Upf+hl7gLAv/cl3rlYPXlTAY=
X-Received: by 2002:a05:620a:4887:b0:7fc:e0c1:7d47 with SMTP id
 af79cd13be357-87a36b52d72mr1691776885a.8.1759807927766; Mon, 06 Oct 2025
 20:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251007013207.1469618-1-airlied@gmail.com>
 <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
In-Reply-To: <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 7 Oct 2025 13:31:56 +1000
X-Gm-Features: AS18NWAbfxuGZTHfcg1oEvdaXw09W5TzI2ErtFzo1aet-N9hObQxjdaSM2GFK8o
Message-ID: <CAPM=9tx3Q4NdAc5NDGUjdjOH-ZPagKNu43+zOUZTVcpEO9zSsQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 7 Oct 2025 at 13:29, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Tue, 2025-10-07 at 11:32 +1000, Dave Airlie wrote:
> > +config DRM_NOUVEAU_570_ONLY
> > +     bool "Only support 570 firmware, don't add 535 to the initrd."
> > +     depends on DRM_NOUVEAU
> > +     default n
> > +     help
> > +          Nouveau can support 535 and 570 firmwares, but that means both
> > +          will end up in initramfs, bloating it. If you can guarantee you
> > +          have the 570 in your distro or install, enable this option.
> > +
>
> I don't like the idea of using the specific version number in the Kconfig.
>
> Can we rename this to "DRM_NOUVEAU_LATEST_FW_ONLY" or something like that, and Nouveau
> automatically only supports whatever the latest version is?  I know we probably won't add
> support for anything after 570, but we might.

We can't do that, because if we moved to 580, and distros have this
option on for 570, they would fail unless they had the 580 firmware,
so it needs to be versioned.

Dave.
