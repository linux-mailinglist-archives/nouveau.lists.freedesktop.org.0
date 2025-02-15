Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE41A36C79
	for <lists+nouveau@lfdr.de>; Sat, 15 Feb 2025 08:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9210E184;
	Sat, 15 Feb 2025 07:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ypx4tJik";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1C10E184
 for <nouveau@lists.freedesktop.org>; Sat, 15 Feb 2025 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739605102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWDjtb7Rhn51HfchEFLh7MLZr0T/SMf389ZL5QPUH0M=;
 b=Ypx4tJikZGeX2L66/U2wm9+001uDN1SMSHn0jvPYgFPphvCKq1uoUGucJ7lTsQRidC5NuE
 itqvKvGsZMhNHYlpsxqzF0oVJlG/klDsO2G4/EtOavGFhNUcehhNeEwGYZu3sUaT6Ty9qW
 MKe6NFAauUvUC3Jdu9PxVUTTl5/skDw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-zvR50E7lP9-1g11fXhdyig-1; Sat, 15 Feb 2025 02:38:20 -0500
X-MC-Unique: zvR50E7lP9-1g11fXhdyig-1
X-Mimecast-MFC-AGG-ID: zvR50E7lP9-1g11fXhdyig_1739605100
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5e0412dd901so57969a12.2
 for <nouveau@lists.freedesktop.org>; Fri, 14 Feb 2025 23:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739605100; x=1740209900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWDjtb7Rhn51HfchEFLh7MLZr0T/SMf389ZL5QPUH0M=;
 b=VL7IjmTtn11r4gixR0yjmJPLkRWApN2RlgZ3pOI9PIWtZ+d/rNqRtvnFHSa9i0/uKO
 JYSg4InsBhrOMGQ/yv/FcSb4coQLdYpTkTErrId//C2EkJa+pPyXc7INNJhCgT3GxoZx
 8LvWo1xFrXtE003S4GnS6fP1wHn/mNMdFzVGlQqCVSCN3nYHRCEz08b6/0Eg8gdGqhL5
 C+QIlUVX7lHSDUGN7XsHEE/seKX1GuNU5FoS0w6KDdO2ugkGpT1lGG8U8muqnPa4IbB+
 dAyemVjZsK5RndYHHIz2o4ZEbof0kqBEV7Gh53SbM9tfMZ+mJmvWL9ZCO6RiNriQ+aV3
 j4BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDhw4hmH7P+ETj2jJ1dwkpJQZJQA+ngIiYWScA4AzX7BnD6qPJ46+Bart9vGiD9bRnzHfNWrfQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlHcY2q9BDSjhgq9KDpN44XzM044XtUsZcQmPDeRUfV2MSVod8
 0r3FTWBKJPzqN+N240OMegkHZckyuDbsr9oU9Cj3nNrT4o5yjGQYkYRdlcB8JyevXE9oWzSrIqi
 lftLLuk4UuTpSQ9RSaU3pJPxvv4GqrzuqRLEhOjNxduc0KjZl+45ukzyeXJJ6QwI=
X-Gm-Gg: ASbGncsqcqWvwEtvYayviOGP8uzu+9arRR1Rwis41TdwPxVaBnxfOzlgPgursI3ygng
 i+0h9RPS9jployzVbUkcHHAECxRwJRF5QhVVMIjHksCLhRKj8mOMfG40+BvjtgiQWv+qcUWBsz5
 naAMifAZVUK+b0qHQCoEC0PDJ+o/KzuNGJoGYCt1TFV+8XgnKhvLBkCc3l7eyaYYETowNHskEf5
 GLKHZH4HsgomzoV99dUg1Up3d/FxtIdaFUifeQTbb2NmxMLFbU//FtU5IwTSdxW6qce0txxl7Xt
 +Ss=
X-Received: by 2002:a05:6402:2114:b0:5e0:2996:7300 with SMTP id
 4fb4d7f45d1cf-5e0361c8668mr1789933a12.20.1739605099606; 
 Fri, 14 Feb 2025 23:38:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY1Jd8Xn9OrRCkMKnwl4e4BSKlBOGfI4udUpcfDESdHQdqzAx+ErE8yPbXqncelWxpQRVCsg==
X-Received: by 2002:a05:6402:2114:b0:5e0:2996:7300 with SMTP id
 4fb4d7f45d1cf-5e0361c8668mr1789906a12.20.1739605098571; 
 Fri, 14 Feb 2025 23:38:18 -0800 (PST)
Received: from kherbst.lan ([188.192.20.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ded69e7c33sm3195322a12.61.2025.02.14.23.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 23:38:14 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>
Subject: [PATCH 1/1] MAINTAINERS: Remove myself
Date: Sat, 15 Feb 2025 08:37:53 +0100
Message-ID: <20250215073753.1217002-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250215073753.1217002-1-kherbst@redhat.com>
References: <20250215073753.1217002-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WvVtj9jii2f97k9ACYLK2wVnBa59SkoQzsiJceUHTFE_1739605100
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

I was pondering with myself for a while if I should just make it official
that I'm not really involved in the kernel community anymore, neither as a
reviewer, nor as a maintainer.

Most of the time I simply excused myself with "if something urgent comes
up, I can chime in and help out". Lyude and Danilo are doing a wonderful
job and I've put all my trust into them.

However, there is one thing I can't stand and it's hurting me the most.
I'm convinced, no, my core believe is, that inclusivity and respect,
working with others as equals, no power plays involved, is how we should
work together within the Free and Open Source community.

I can understand maintainers needing to learn, being concerned on
technical points. Everybody deserves the time to understand and learn. It
is my true belief that most people are capable of change eventually. I
truly believe this community can change from within, however this doesn't
mean it's going to be a smooth process.

The moment I made up my mind about this was reading the following words
written by a maintainer within the kernel community:

	"we are the thin blue line"

This isn't okay. This isn't creating an inclusive environment. This isn't
okay with the current political situation especially in the US. A
maintainer speaking those words can't be kept. No matter how important
or critical or relevant they are. They need to be removed until they
learn. Learn what those words mean for a lot of marginalized people. Learn
about what horrors it evokes in their minds.

I can't in good faith remain to be part of a project and its community
where those words are tolerated. Those words are not technical, they are
a political statement. Even if unintentionally, such words carry power,
they carry meanings one needs to be aware of. They do cause an immense
amount of harm.

I wish the best of luck for everybody to continue to try to work from
within. You got my full support and I won't hold it against anybody trying
to improve the community, it's a thankless job, it's a lot of work. People
will continue to burn out.

I got burned out enough by myself caring about the bits I maintained, but
eventually I had to realize my limits. The obligation I felt was eating me
from inside. It stopped being fun at some point and I reached a point
where I simply couldn't continue the work I was so motivated doing as I've
did in the early days.

Please respect my wishes and put this statement as is into the tree.
Leaving anything out destroys its entire meaning.

Respectfully

Karol

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353de..ca31e57fa203c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7431,7 +7431,6 @@ F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
-M:	Karol Herbst <kherbst@redhat.com>
 M:	Lyude Paul <lyude@redhat.com>
 M:	Danilo Krummrich <dakr@kernel.org>
 L:	dri-devel@lists.freedesktop.org
@@ -24062,7 +24061,6 @@ F:	tools/testing/selftests/ftrace/
 TRACING MMIO ACCESSES (MMIOTRACE)
 M:	Steven Rostedt <rostedt@goodmis.org>
 M:	Masami Hiramatsu <mhiramat@kernel.org>
-R:	Karol Herbst <karolherbst@gmail.com>
 R:	Pekka Paalanen <ppaalanen@gmail.com>
 L:	linux-kernel@vger.kernel.org
 L:	nouveau@lists.freedesktop.org
-- 
2.48.1

