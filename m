Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8FD2CB678
	for <lists+nouveau@lfdr.de>; Wed,  2 Dec 2020 09:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25A56E9FF;
	Wed,  2 Dec 2020 08:12:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8C96EA06
 for <nouveau@lists.freedesktop.org>; Wed,  2 Dec 2020 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0FfFn+Ish8OF5tVu3W/ZC0N4Vo8H/vl/5w3ii7Oo/0=;
 b=DuhejzYtRZs28BCD4MftQze8/3k2DbgO6t8nutmbwWm9ZSDsnBUvfhU9h+Gp31DDKC5Ci7
 0zkhHtBAgGOGKjv8BHfl/BIZw2Is0SB0p/OH60imnjuut1mHiioXXxd5DaPr2zzV2omu6i
 WEBRLSRL8OGrgVDxXLAD1UXXB6uaWaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-4B4xtEiBPJ6lRcXmFX0iIQ-1; Wed, 02 Dec 2020 03:11:50 -0500
X-MC-Unique: 4B4xtEiBPJ6lRcXmFX0iIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C68ED1006C91;
 Wed,  2 Dec 2020 08:11:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78CF710023AE;
 Wed,  2 Dec 2020 08:11:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6CEF416E31; Wed,  2 Dec 2020 09:11:47 +0100 (CET)
Date: Wed, 2 Dec 2020 09:11:47 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20201202081147.fhcba7qz4drffaud@sirius.home.kraxel.org>
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-15-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201201103542.2182-15-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH v2 14/20] drm/qxl: Remove references to struct
 drm_device.pdev
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
Cc: Sam Ravnborg <sam@ravnborg.org>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Dec 01, 2020 at 11:35:36AM +0100, Thomas Zimmermann wrote:
> Using struct drm_device.pdev is deprecated. Convert qxl to struct
> drm_device.dev. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
