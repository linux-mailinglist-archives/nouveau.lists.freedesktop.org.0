Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D134A27F15B
	for <lists+nouveau@lfdr.de>; Wed, 30 Sep 2020 20:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7946E7D9;
	Wed, 30 Sep 2020 18:33:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAF86E7D9
 for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2020 18:33:26 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601490805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iqPZyFHDdtV1UzEv+Q2SHqF5Q6dpD6DaSkOus1P8vI=;
 b=Q3lMirv8lC1ghlWWGm93g3NU9UMZ1qzpMikcZsZYM1Me2qBj2mbnSA/U3N6yUGVHTPfOBc
 uNL4RceO9iQ0TRhtSLO2el3wZCXdtZnZYn3LJ4tDIDcy64eahdjThuwX4ecciH8BypZVDt
 F7ODzKqKedLYoKWvSHBbiZmAamVG0Ss=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-zlOSALDDO5iRNtzWtO4lHQ-1; Wed, 30 Sep 2020 14:33:23 -0400
X-MC-Unique: zlOSALDDO5iRNtzWtO4lHQ-1
Received: by mail-qk1-f199.google.com with SMTP id h191so1504570qke.1
 for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2020 11:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3iqPZyFHDdtV1UzEv+Q2SHqF5Q6dpD6DaSkOus1P8vI=;
 b=aXO8oG9OQ5MAKFH4Q6HJV+HnEdzq2lwDMQYWeswIon3aMFjxJQoLgQHNPMiA5MPo1f
 TQgJs3TbuhpXw1ruufJmJAaqSobirfo88avLY7b4BDcl7JNxHuiWzxy+SbCsbsj7pWm5
 kP1lVmqz7VfiCuHzNErFHOhZ3V/VfNUNdFI8QwFjiQVkOrkzt/7ObnbAXV6jRsV0okhX
 7h2xICCJHxaQ9uxe6qzY7dD5oh4u2ab5jJZW1AHrTW2+vY2aq/fKfdI1Z9RaoQQjUTuL
 EUmIt+4RvIInYoM1GEdH/eOLFg8a1eRmN9kCTmAAwXgaT9ON8rUA8wTw9qrRfl82zXAk
 tsww==
X-Gm-Message-State: AOAM530LYp4ti7AriJ6aUjgWjwKa7WHfIhYa2zRiCBYWBsn6NCmB31kQ
 iccZylM+RAfJTVJ2VWwFX6OkGfoAv0XX7T+9iAgr5sdKVtAuCqfPKDx5GyYpIVv1uUFstwJ5mzo
 3LDqZQIGJbPTMjdCqk98BwQvh+w==
X-Received: by 2002:a05:620a:13d1:: with SMTP id
 g17mr3821805qkl.413.1601490802866; 
 Wed, 30 Sep 2020 11:33:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9K1UMSkKw/sgYXCZtFS4LQuayF291swqbMM5X9Ng2Flpg4DZAYoVnWjR55A18NKrUZSlSPQ==
X-Received: by 2002:a05:620a:13d1:: with SMTP id
 g17mr3821782qkl.413.1601490802632; 
 Wed, 30 Sep 2020 11:33:22 -0700 (PDT)
Received: from xps13 ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id x59sm3177319qte.14.2020.09.30.11.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 11:33:22 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:33:20 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Lyude <lyude@redhat.com>
Message-ID: <20200930183320.GB518504@xps13>
References: <20200930173150.431995-1-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200930173150.431995-1-lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH i-g-t v5 0/5] Add nouveau-crc tests
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 01:31:45PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Nouveau has finally gotten CRC support, and at this point that support
> has made its way upstream. Hooray!
> 
> So, let's start adding some relevant tests for it since nvidia's CRC
> implementation has some rather interesting design choices that needed to
> be worked around.
> 
> Lyude Paul (5):
>   lib/igt_core: Fix igt_assert_fd() documentation
>   lib/igt_core: Add igt_require_fd()
>   lib/igt_debugfs: Add igt_debugfs_pipe_dir()
>   lib/igt_kms: Hook up connector dithering prop
>   tests: Add nouveau-crc tests
> 
>  .gitlab-ci.yml      |   2 +-
>  lib/drmtest.c       |  10 ++
>  lib/drmtest.h       |   2 +
>  lib/igt_core.h      |  16 +-
>  lib/igt_debugfs.c   |  21 +++
>  lib/igt_debugfs.h   |   1 +
>  lib/igt_kms.c       |   5 +
>  lib/igt_kms.h       |   1 +
>  tests/meson.build   |   1 +
>  tests/nouveau_crc.c | 414 ++++++++++++++++++++++++++++++++++++++++++++
>  10 files changed, 470 insertions(+), 3 deletions(-)
>  create mode 100644 tests/nouveau_crc.c
> 
> -- 
> 2.26.2
> 

Looks good, all the tests pass now that I've removed the serial cable.
For the series:

Reviewed-by: Jeremy Cline <jcline@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
