Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C757029D355
	for <lists+nouveau@lfdr.de>; Wed, 28 Oct 2020 22:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D4C6E5C0;
	Wed, 28 Oct 2020 21:43:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874696E5CD
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603921381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=grsrDmScQg/7CchDudKF7+xGExagB0pI7A6n0ZS4Tvs=;
 b=SUyGE1X3PyUn96+cLhV1kJm8OsK50lO8iLoWktCzU3ypz4UDba9Klri5ltJ5uycOD/+zC9
 aiIFoLJZ+Pn1qc0RT9J87J+yy0QdW8kuHuCJk+ewYldbWrJcjFz7PArGpY2/ZMjo/C51i8
 UhLTVBaueRetecjP2+YK1CU9b2a9qK8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-0LeekIcxM2-J_ZDK_GfGkg-1; Wed, 28 Oct 2020 17:42:59 -0400
X-MC-Unique: 0LeekIcxM2-J_ZDK_GfGkg-1
Received: by mail-qv1-f72.google.com with SMTP id v4so528909qvr.19
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 14:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=grsrDmScQg/7CchDudKF7+xGExagB0pI7A6n0ZS4Tvs=;
 b=Xb3CrmGiZL+U060bsC1eCfaj0rajrglkyDRKdFPaFanv6O/A2nqvWifhZGDfQ2Qiw6
 jfdkfxI5zWREO/iUpOu30XbAF3Y8zcdQFACHHkCLBltpHvOYQnUnmhY9ry/ELWII+sN8
 VCKaw9AT2eBqVNZHXHxNbnIuJv/godHmqILWbYpwodku0acuhGJ1ES+pRMm4lvBjK12E
 BntJzUIUHyfY0iQ4d84xm6E2PrDHziyKN7yJdLaCchjh7puHvJAq47HCtWZwtVQWNevK
 P7O1xC0bmIC9TQrRpsA0BrHPLl9GeMnm/f/tDWG8zOD1g77a8ege7Ov+IoziVW1CjLrN
 XxCA==
X-Gm-Message-State: AOAM532NS2a5EkzRCpkv7YleV9XeB92dhtRc8Bkj3KuxtNh8OiCGZyxe
 95gMWzOklnFPmMEUiD9uDK2bdQYMwpRg1RmgD5yk4P3Bkav0/QnXZISEcgL4+8Ytl5xlrUo43vi
 kA4bZEpXf+6Rok8CkHeBXxtOerBCVZ8HuHKkbieOsIg==
X-Received: by 2002:a37:8542:: with SMTP id h63mr941208qkd.102.1603921378885; 
 Wed, 28 Oct 2020 14:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbl4uDNWjzMTK3+styptRLBCtkBZ2fw1p+2J0J4m60L0jC7kvcirPiI4FpA37Rxh2PKX+RSbbSACEWMb0WJsA=
X-Received: by 2002:a37:8542:: with SMTP id h63mr941197qkd.102.1603921378676; 
 Wed, 28 Oct 2020 14:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <202010092326.20482.linux@zary.sk>
 <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
 <CACO55tuAxbcXbC9zrT5rs34s=5uBugkbcikORU5868ka9bHdkw@mail.gmail.com>
 <202010282115.32811.linux@zary.sk>
In-Reply-To: <202010282115.32811.linux@zary.sk>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 28 Oct 2020 22:42:47 +0100
Message-ID: <CACO55tvqB0tEbHegRCn6WNdv-wzZz1+be=u5O0q9SrSj1x1tGw@mail.gmail.com>
To: Ondrej Zary <linux@zary.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I sent a patch to the mailing list and wanted to have some review on
that from at least Ben, but no idea if Ben already picked it and if
it's good enough for sending it to stable yet.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
