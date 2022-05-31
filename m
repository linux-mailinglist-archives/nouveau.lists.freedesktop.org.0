Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C2538E1B
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7B01125BE;
	Tue, 31 May 2022 10:00:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D401125CB;
 Tue, 31 May 2022 10:00:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id gh17so25575851ejc.6;
 Tue, 31 May 2022 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9n4cw6tJMuGq8sS9FRBgBhCHODwjr6qBUbzPf/1V2sg=;
 b=IzX+BgNjUX84qtPBtVsu+ZQQ2nO4Huw6BvTBNd8rhiurCDNaaV5UMg4BXEj7C+GRmG
 pLAlNrJvCnrtY74d5Bo/qYvdZdIp6QkYn6H+D4DPT+ND58p4F/z8e2zkIZQsRYdjuNP2
 1DxX3EdJHY8KDTNcYKELGBk86yao2J8VuJlSo/c21/2arZjhHOW0lpAc7cG/anLi+GyZ
 EIYmtu/053mPuutoapsZROblF0FdT729/3v6UpunSQlMe0lkJeQVmj9gHa/cACRiumXh
 G4ykLDd0yxJynuBwQinr7e62C8Qnq4ExNeWx17W3s71BABDAerQSHOy+HAkfJOD712fC
 cGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9n4cw6tJMuGq8sS9FRBgBhCHODwjr6qBUbzPf/1V2sg=;
 b=H47VJ8gTvjgKc0Gnq/n7crNvFlhXr9rIlrGnzcoYhAHxF01Jb713+cFw5NyKhaARMD
 AIi6zemDaA5iqfvcgELByuVGDLxhqLPpZS/XRgfOJ9N5GUXRqJpsnjpjNb58+T9VW4Rj
 NZ3tiailaj/DqyxoPZOSrpK6BXeuq2wac69G0hH6gaZJVHzYUX+5Ht7kvzuySZ5X4B3l
 fgcFnGnQGTC7uLvTPNg0Tjwx5mGb4bJRKgIwFklSl0GdPyDQo/nzPaggFDejt82t62Jv
 oLSRpd+sfTzjCX0lSz+nVOPWF3cjWc7ex/4lDI+yrDm9y44zqFWCc+8JDnPFg5rrMXm2
 2JKQ==
X-Gm-Message-State: AOAM5339IaYA7RJ6OkWyg7+OTMx4mmYnwN+dgtM0LvObKC6p0CuCT5jd
 BO+A+scXAYVFdQPXZXmiH9Q=
X-Google-Smtp-Source: ABdhPJwCJfAmChYPGSG1MS5K/vbZUKtFI7ycuya8OGZo2oGfMsdkIctwKWtBLMWRNLTmB2Z1/mcwZQ==
X-Received: by 2002:a17:907:7d88:b0:6fe:d709:6735 with SMTP id
 oz8-20020a1709077d8800b006fed7096735mr38261002ejc.76.1653991210599; 
 Tue, 31 May 2022 03:00:10 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 11:59:54 +0200
Message-Id: <20220531100007.174649-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] Per file OOM badness
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
Cc: andrey.grodzovsky@amd.com, hughd@google.com, viro@zeniv.linux.org.uk,
 daniel@ffwll.ch, alexander.deucher@amd.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello everyone, 

To summarize the issue I'm trying to address here: Processes can allocate
resources through a file descriptor without being held responsible for it.

Especially for the DRM graphics driver subsystem this is rather
problematic. Modern games tend to allocate huge amounts of system memory
through the DRM drivers to make it accessible to GPU rendering.

But even outside of the DRM subsystem this problem exists and it is
trivial to exploit. See the following simple example of
using memfd_create():

         fd = memfd_create("test", 0);
         while (1)
                 write(fd, page, 4096);

Compile this and you can bring down any standard desktop system within
seconds.

The background is that the OOM killer will kill every processes in the
system, but just not the one which holds the only reference to the memory
allocated by the memfd.

Those problems where brought up on the mailing list multiple times now
[1][2][3], but without any final conclusion how to address them. Since
file descriptors are considered shared the process can not directly held
accountable for allocations made through them. Additional to that file
descriptors can also easily move between processes as well.

So what this patch set does is to instead of trying to account the
allocated memory to a specific process it adds a callback to struct
file_operations which the OOM killer can use to query the specific OOM
badness of this file reference. This badness is then divided by the
file_count, so that every process using a shmem file, DMA-buf or DRM
driver will get it's equal amount of OOM badness.

Callbacks are then implemented for the two core users (memfd and DMA-buf)
as well as 72 DRM based graphics drivers.

The result is that the OOM killer can now much better judge if a process
is worth killing to free up memory. Resulting a quite a bit better system
stability in OOM situations, especially while running games.

The only other possibility I can see would be to change the accounting of
resources whenever references to the file structure change, but this would
mean quite some additional overhead for a rather common operation.

Additionally I think trying to limit device driver allocations using
cgroups is orthogonal to this effort. While cgroups is very useful, it
works on per process limits and tries to enforce a collaborative model on
memory management while the OOM killer enforces a competitive model.

Please comment and/or review, we have that problem flying around for years
now and are not at a point where we finally need to find a solution for
this.

Regards,
Christian.

[1] https://lists.freedesktop.org/archives/dri-devel/2015-September/089778.html
[2] https://lkml.org/lkml/2018/1/18/543
[3] https://lkml.org/lkml/2021/2/4/799


