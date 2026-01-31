package dev.minecrafttest;

import org.bukkit.plugin.java.JavaPlugin;

/**
 * 마인크래프트 Paper 서버 플러그인 메인 클래스
 */
public final class MinecraftTestPlugin extends JavaPlugin {

    @Override
    public void onEnable() {
        getLogger().info("MinecraftTest 플러그인이 활성화되었습니다!");
    }

    @Override
    public void onDisable() {
        getLogger().info("MinecraftTest 플러그인이 비활성화되었습니다.");
    }
}
