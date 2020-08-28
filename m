Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A982568E7
	for <lists+nouveau@lfdr.de>; Sat, 29 Aug 2020 17:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429E76E17C;
	Sat, 29 Aug 2020 15:59:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Fri, 28 Aug 2020 18:36:04 UTC
Received: from hrbata.com (hrbata.com [109.123.216.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id CECC56E042
 for <nouveau@lists.freedesktop.org>; Fri, 28 Aug 2020 18:36:04 +0000 (UTC)
Received: from localhost (ip-89-102-37-204.net.upcbroadband.cz [89.102.37.204])
 by hrbata.com (Postfix) with ESMTPSA id 0CE2945D19;
 Fri, 28 Aug 2020 20:29:22 +0200 (CEST)
Date: Fri, 28 Aug 2020 20:29:21 +0200
From: Frantisek Hrbata <frantisek@hrbata.com>
To: nouveau@lists.freedesktop.org
Message-ID: <20200828182921.GQ3489@localhost.localdomain>
References: <20200828092846.GA11454@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828092846.GA11454@localhost.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Sat, 29 Aug 2020 15:59:32 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau: bail out of nouveau_channel_new
 if channel init fails
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
Reply-To: Frantisek Hrbata <frantisek@hrbata.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

I'm sorry for another email, but it seems that all lines in the
reproducer starting with '#' got trimmed as they were comments.
Probably something I did on my side :(. Would it be possible to
fix this in the commit msg or do you prefer v2?

Thank you

simplified reproducer
---------------------------------8<----------------------------------------
/*
 * gcc -o crashme crashme.c
 * ./crashme /dev/dri/renderD128
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <drm/drm.h>
#include <drm/nouveau_drm.h>
#include <inttypes.h>
#include <string.h>
#include <error.h>

#define die(format, err, ...)  error(1, err, format, ## __VA_ARGS__)

#ifndef DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC
struct drm_nouveau_channel_alloc {
	uint32_t     fb_ctxdma_handle;
	uint32_t     tt_ctxdma_handle;

	int          channel;
	uint32_t     pushbuf_domains;

	/* Notifier memory */
	uint32_t     notifier_handle;

	/* DRM-enforced subchannel assignments */
	struct {
		uint32_t handle;
		uint32_t grclass;
	} subchan[8];
	uint32_t nr_subchan;
};
#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
#endif

static struct drm_nouveau_channel_alloc channel;

int main(int argc, char *argv[]) {
	int fd;
	int rv;

	if (argc != 2)
		die("usage: %s <dev>", 0, argv[0]);

	if ((fd = open(argv[1], O_RDONLY)) == -1)
		die("open %s", errno, argv[1]);

	if (ioctl(fd, DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC, &channel) == -1 &&
			errno == EACCES)
		die("ioctl %s", errno, argv[1]);

	close(fd);

	printf("PASS\n");

	return 0;
}
---------------------------------8<----------------------------------------

-- 
Frantisek Hrbata
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
