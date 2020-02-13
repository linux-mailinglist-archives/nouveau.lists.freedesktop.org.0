Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF99515CD16
	for <lists+nouveau@lfdr.de>; Thu, 13 Feb 2020 22:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B306F87D;
	Thu, 13 Feb 2020 21:19:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54996F87D
 for <nouveau@lists.freedesktop.org>; Thu, 13 Feb 2020 21:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581628765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeytvoYSh96I8mtSTlSSduno0MzSFAndk4/HpJXIggQ=;
 b=JAQCSoWXBsjyu+BuBw6I+9rwLbdq5orvMqLg+cWbmJ703XDikDKnuaK3K4aCCUiaCaipF4
 h5a32fUM9KCqCM7WYnj5JMFpolCxRvTDmGmM7FWzUZ9VbR6QEA1tSXplgSEyAoBifGPX1z
 4BMQ3lLz2lQtRp9ys0ZR9f3mvaIm3n4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-29MYGxp-O_6RkDefwkRzvw-1; Thu, 13 Feb 2020 16:19:23 -0500
Received: by mail-qt1-f199.google.com with SMTP id o18so4589847qtt.19
 for <nouveau@lists.freedesktop.org>; Thu, 13 Feb 2020 13:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=qeytvoYSh96I8mtSTlSSduno0MzSFAndk4/HpJXIggQ=;
 b=XtoLcKU0kRTknQXGH+rNQlEDONidK325IMhbR04D5YPQwuUz8BgJrD+hN+/MBUBqUL
 DfuMOs41QGTg6y/qROV9W0vXBD/Vhu+mpIsX4F/x/7apuS/QAVi/eDHoCsLfLaSEMNWw
 hfwBiiPjYRzNBcZIM8KrYFEuIYOqPtfEW7v/lh3+vv6BxcaCB3H49mqNDxAdgaRDUHXx
 eOsSbcZJb49qdxTSb67tAu/DG5DBHaEW2cWX7YFGUR+OY0/tCazj/SDOPVbrgJI/PfIf
 zHpKYjzZLZAoOX1rAjW+qMJBl/GGg2W0wSYUr0P4vOa4lPDvrXklVHUkd69750MdrCfb
 uFwA==
X-Gm-Message-State: APjAAAU/YUlgjEu0i5gtIAVyufYvj/c4F1Mm9Gmz/0NnfwbaApkgDuMc
 4aVLKGh01RMEIc/Oxc+UDDhgiegbLrZKA/95QxuMUsVmnZ5pmaeioReWPJk+ktUuf2ksetXuBpx
 BfePrt+SjLuv0P/Mvimiitx+ecQ==
X-Received: by 2002:ad4:5009:: with SMTP id s9mr25210821qvo.30.1581628763488; 
 Thu, 13 Feb 2020 13:19:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqzCmwC9yQ4A7PXjkJND1n6vE/oKPj8aI5adAYbhOPDc4vtyT9di5NVjr8sdOtwipFJs2QsKhw==
X-Received: by 2002:ad4:5009:: with SMTP id s9mr25210801qvo.30.1581628763216; 
 Thu, 13 Feb 2020 13:19:23 -0800 (PST)
Received: from dhcp-10-20-1-196.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id i13sm1989297qki.70.2020.02.13.13.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 13:19:22 -0800 (PST)
Message-ID: <ca9cf8a812f4dabcfd74d66c1170c31e97f9c7b9.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org
Date: Thu, 13 Feb 2020 16:19:21 -0500
In-Reply-To: <20200213173705.3FD89206ED@mail.kernel.org>
References: <20200212231150.171495-1-lyude@redhat.com>
 <20200213173705.3FD89206ED@mail.kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: 29MYGxp-O_6RkDefwkRzvw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/gv100-: Re-set LUT after
 clearing for modesets
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
Cc: Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 2020-02-13 at 17:37 +0000, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a "Fixes:" tag,
> fixing commit: facaed62b4cb ("drm/nouveau/kms/gv100: initial support").
> 
> The bot has tested the following trees: v5.5.3, v5.4.19, v4.19.103.
> 
> v5.5.3: Build OK!
> v5.4.19: Build OK!
> v4.19.103: Failed to apply! Possible dependencies:
>     88b703527ba7 ("drm/nouveau/kms/gf119-: add ctm property support")
>     cb55cd0c66a1 ("drm/nouveau/kms/nv50-: allow more flexibility with lut
> formats")
> 
> 
> NOTE: The patch will not be queued to stable trees until it is upstream.
> 
> How should we proceed with this patch?

Apply it to 5.5.3, 5.4.19. We can drop the rest

> 
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
